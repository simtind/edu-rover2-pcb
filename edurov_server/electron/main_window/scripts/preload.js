

console.log("Preloading")
const ipc = require('electron').ipcRenderer;
const bridge = require('electron').contextBridge;

bridge.exposeInMainWorld(
    'rov',
    {
        get_address:
            (callback) => 
            {
                ipc.on("address", callback);
                ipc.send("get_address");
            }
    }
)
