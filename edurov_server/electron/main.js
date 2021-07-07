// Modules to control application life and create native browser window
const {app, BrowserWindow} = require('electron')
const ipc = require('electron').ipcMain;
const path = require('path');
const ping = require('ping');
const WebSocket = require('ws');
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

function get_ips_from_subnet_range(cidr)
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

    var ip_mask = ~(0xFFFFFFFF >>> parseInt(bits));
    var subnet_ip = ip2int(ip_string) & ip_mask;
    const ips_in_subnet = 2 ** (32 - bits);
    
    var ips = [];
    for (var i = 0; i < ips_in_subnet; i++)
    {
        ips.push(int2ip(subnet_ip + i));
    }

    return ips;
}

function call_if_edurov(ip, callback)
{
    // Ping IP to see if it contains a live host.
    ping.sys.probe(ip, function(isAlive){
        console.log(isAlive ? 'host ' + ip + ' is alive' : 'host ' + ip + ' is dead');
        if (isAlive)
        {
            // Attempt to connect to EduROV name service on host. 
            // If it's an edurov, we'll get a message back with it's name.
            const client = new WebSocket('ws://' + ip + ":8083", "", {handshakeTimeout: 100});

            client.onmessage = 
                (message) => 
                {
                    console.log('host ' + ip + ' is an edurov' );
                    callback(message.data);
                    client.close();
                };
            client.onerror =
                () => 
                {
                    console.log('host ' + ip + ' is not an edurov' );
                    callback("unknown");
                };
        }
    });
}

function do_ip_search(window)
{
    const interfaces = os.networkInterfaces();
    var ips = []

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

            ips.push(...get_ips_from_subnet_range(connection.cidr));
        }
    }

    
    ips.forEach((ip) => {call_if_edurov(ip, (message) => window.webContents.send("ip_search_result", [ip, message]))});
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