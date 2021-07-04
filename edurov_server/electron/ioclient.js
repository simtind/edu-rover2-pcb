var WebSocketClient = require('websocket').client;
const { ipcMain } = require('electron');

client = null;
connection = null;

export function io_send(data) {
    if (connection && connection.connected)
    {
        connection.send(JSON.stringify(data));
    }
}

export function io_close(){
    if (connection && connection.connected)
    {
        connection.close();
    }
}

export function io_open(address, window) {

    console.log("Starting I/O server");
    
    // Create WebSocket connection.
    client = new WebSocketClient(address);
    
    client.on(
        'connect', 
        function(_connection) 
        {
            console.log("I/O Server Connection made");
            connection = _connection;

            connection.send("Start");
            
            connection.on(
                'message', 
                (event) => 
                {
                    window.webContents.send('sensors', event.data);
                }
            );
            connection.on('close', () => {console.log("I/O server connection closed");});
        }
    );
    
    client.connect(address, 'echo-protocol');
}
