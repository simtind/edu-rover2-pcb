// Modules to control application life and create native browser window
const {app, BrowserWindow} = require('electron')
const ipc = require('electron').ipcMain;
const path = require('path');
const ping = require('ping');
const WebSocket = require('ws');
const arp = require('node-arp');
const os = require("os");

function createWindow () {
    const source_dir = path.join(__dirname, "main_window");
    // Create the browser window.
    var window = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            contextIsolation: true,
            preload: path.join(source_dir, "scripts", "preload.js")
        }
    });

    // and load the index.html of the app.
    window.loadFile(path.join(source_dir, "index.html"));

    // Open the DevTools.
    window.webContents.openDevTools()

    return window;
}

function get_ips_from_subnet_range(interface_name, cidr)
{            
    const cidr_components = cidr.split("/");
    const ip_string = cidr_components[0];
    const bits = cidr_components[1];

    function ip2int(ipString)
    {
        return ipString.split('.').reduce(function(ipInt, octet) { return (ipInt<<8) + parseInt(octet, 10)}, 0) >>> 0;
    }
    function int2ip (ipInt) {
        return ( (ipInt>>>24) +'.' + (ipInt>>>16 & 255) +'.' + (ipInt>>>8 & 255) +'.' + (ipInt & 255) );
    }

    var ips = [];

    if (bits == 32)
    {
        // Special case, there are no other devices on the network, and 
        // this value causes the ip_mask evaluation to fail.
        return ips;
    }

    const ip_mask = ~(0xFFFFFFFF >>> parseInt(bits));
    const host_ip = ip2int(ip_string);
    const subnet_ip = host_ip & ip_mask;
    const num_ips = 2 ** (32 - bits);
    
    for (var ip = subnet_ip; ip < subnet_ip + num_ips; ip++)
    {
        if (int2ip(ip) == ip_string)
        {
            continue;
        }
        ips.push({interface: interface_name, ip: int2ip(ip)});
    }

    return ips;
}

function call_if_alive(host, callback)
{
    console.log("Ping " + host["ip"]);
    // Ping IP to see if it contains a live host.
    ping.sys.probe(
        host["ip"], 
        function(isAlive)
        {
            console.log(
                isAlive 
                    ? `host ${host["ip"]} on network interface ${host["interface"]} is alive`
                    : `host ${host["ip"]} on network interface ${host["interface"]} is not alive`);
            if (isAlive)
            {
                arp.getMAC(
                    host["ip"], 
                    function(err, mac) 
                    {
                        if (!err) {
                            const is_raspberry =    mac.startsWith("b8:27:eb") |
                                                    mac.startsWith("dc:a6:32") |
                                                    mac.startsWith("e4:5f:01");
                            console.log(`host ${host["ip"]} is ${is_raspberry ? '' : 'not'} an edurov`);
                            callback(mac, is_raspberry);
                        }
                    }
                );
            }
        },
        { timeout: 1 }
    );
}

function do_ip_search(window)
{
    const interfaces = os.networkInterfaces();
    var hosts = []

    for (const key in interfaces)
    {
        const interface = interfaces[key];
        for (const index in interface)
        {
            const connection = interface[index];
            if (connection.internal || connection.family == "IPv6")
            {
                continue;
            }

            hosts.push(...get_ips_from_subnet_range(key, connection.cidr));
        }
    }

    var prev_percent = 0;
    hosts.forEach(
        (host, index) => 
        {
            const percent = Math.ceil(index * 100 / hosts.length);
            if (percent > prev_percent)
            {
                window.webContents.send("ip_search_progress", percent);
                prev_percent = percent;   
            }
            call_if_alive(host, 
                (mac, is_raspberry) => window.webContents.send("ip_search_result", 
                    {
                        ip:host["ip"], 
                        mac:mac,
                        interface:host["interface"],
                        is_raspberry:is_raspberry
                    }
                )
            )
        }
    );
}

function start_main_window(splash_window, address)
{
    const window = createWindow();
    splash_window.close();

    ipc.on("get_address", () => window.webContents.send("address", address));
}

function createSplash () {
    const source_dir = path.join(__dirname, "splash_screen");

    // Create the browser window.
    var window = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            contextIsolation: true,
            preload: path.join(source_dir, "scripts", "preload.js")
        }
    });

    // and load the index.html of the app.
    window.loadFile(path.join(source_dir, "index.html"));

    // Open the DevTools.
    // mainWindow.webContents.openDevTools()

    ipc.on("ip_search_start", () => do_ip_search(window));
    ipc.on("start", (event, address) => start_main_window(window, address));

    return window;
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createSplash()
  
  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createSplash()
  })
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.