

console.log("Preloading")
const ipc = require('electron').ipcRenderer;
const bridge = require('electron').contextBridge;

bridge.exposeInMainWorld(
    'rov',
    {
        stop: () => ipc.send("stop"),
        start: (address) => ipc.send("start", address),
        armed:
        {
            toggle: () => ipc.send("armed-toggle"),
            on_set: (callback) => ipc.on("armed-set", callback),
            on_toggle: (callback) => ipc.on("armed-toggle", callback),
        },
        light:
        {
            toggle: (intensity) => ipc.send("light-toggle", intensity),
            set: (intensity) => ipc.send("light-set", intensity),
            on_toggle: (callback) => ipc.on("light-toggle", callback),
            on_set: (callback) => ipc.on("light-set", callback),
        },
        sensitivity:
        {
            set: (sensitivity) => ipc.send("sensitivity-set", sensitivity)
        },
        sensors:
        {
            set_interval: (interval) => ipc.send("sensors-interval-set", interval),
            on_data: (callback) =>ipc.on("sensors-data", callback)
        },
        video:
        {
            on_start: (callback) => ipc.on("video-start", callback),
            cinema:
            {
                on_toggle: (callback) => ipc.on("video-toggle-cinema", callback),
                on_exit: (callback) => ipc.on("video-exit-cinema", callback),
            }
        },
        controls:
        {
            set_starboard: (power) => 
            {
                ipc.send("controls-set-starboard", power);
            },
            set_port: (power) => 
            {
                ipc.send("controls-set-port", power);
            },
            set_vertical: (power) => 
            {
                ipc.send("controls-set-vertical", power);
            },
        }
    }
)
