export class IOClient {
    client = null;

    OpenHandler(event) {
        console.log("I/O Server Connection made");
        this.client.send("Start");
    }

    Send(data) {
        this.client.send(JSON.stringify(data));
    }

    CloseHandler(event) {
        console.log("I/O server connection closed");
    }

    Close(){
        this.client.close();
    }

    constructor(messageHandler) {
        var self = this;

        console.log("Starting I/O server");
        // Get I/O Server address, and start websocket session
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = () => {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                // Create WebSocket connection.
                self.client = new WebSocket(xhttp.responseText);
                console.log("Received I/O server url", xhttp.responseText)
                self.client.addEventListener('open', () => {self.OpenHandler(event)});
                self.client.addEventListener('close', () => {self.CloseHandler(event);});
                self.client.addEventListener('message', messageHandler);

                xhttp = null;
            }
        }
        xhttp.open("GET", "/ioserver", true);
        xhttp.send();
    }
}
