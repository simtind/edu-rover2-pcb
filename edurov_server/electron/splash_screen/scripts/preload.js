

console.log("Preloading")
const ipc = require('electron').ipcRenderer;
const bridge = require('electron').contextBridge;

bridge.exposeInMainWorld(
    'splash',
    {
        ip_search:{
            start: () => ipc.send("ip_search_start"),
            on_result: (callback) => ipc.on("ip_search_result", callback),
        },
        start: (address) => ipc.send("start", address)
    }
)
