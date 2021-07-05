// Modules to control application life and create native browser window
const {app, BrowserWindow} = require('electron')
const ipc = require('electron').ipcMain;
const { actuators_init } = require('./actuators.js');
const { io_send, io_open, io_close } = require('./ioclient.js');
const { keyboard_init } = require('./keyboard.js');
const { gamepad_init } = require('./keyboard.js');

function createWindow () {
    // Create the browser window.
    const window = new BrowserWindow({
        width: 800,
        height: 600
    });

    // and load the index.html of the app.
    window.loadFile('index.html');

    keyboard_init(window);
    gamepad_init(window);

    ipc.on("websockets-start", 
        function(address)
        {
            window.webContents.send('video-start', "ws://${address}:8081");
            io_open(mainWindow, "ws://${address}:8082");
            actuators_init(io);
    
            setTimeout(
                function()
                {
                    console.log("Post actuators");
                    io_send(actuators);
                }
                , 50
            );
        }
    );
    ipc.on("light-set", 
        function(evt, intensity)
        {
            if(actuators['lights'] > 0.0){
                actuators['lights'] = intensity;
            }
            window.webContents.send('light', actuators['lights']);
        }
    )
    ipc.on("light-toggle", 
        function(evt, intensity)
        {
            actuators['lights'] = actuators['lights'] > 0.0 ? 0.0 : intensity;
            window.webContents.send('light', actuators['lights']);
        }
    )
    ipc.on("sensitivity-set", 
        function(evt, sensitivity)
        {
            actuators['sensitivity'] = sensitivity;
        }
    )
    ipc.on("armed-toggle", 
        function(evt)
        {
            actuators['armed']  = !actuators['armed'];
            window.webContents.send('armed', actuators['armed']);
        }
    )
    ipc.on("sensor_interval", 
        function(evt, value)
        {
            actuators['sensor_interval'] = value;
        }
    )
    
    ipc.on("stop", 
        function(evt)
        {
            io_send("stop");
        }
    )

    // Open the DevTools.
    // mainWindow.webContents.openDevTools()
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createWindow()
  
  app.on('activate', function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
  
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
  io_close();
})


// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.