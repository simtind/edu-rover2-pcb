
export class IOClient{
    client = null;

    DummyActuators() {
        this.actuators["vertical" ] += Math.random() - 0.5;
        this.actuators["starboard"] += Math.random() - 0.5;
        this.actuators["port"     ] += Math.random() - 0.5;
        this.actuators["lights"   ] += Math.random() - 0.5;

        this.client.send(JSON.stringify(this.actuators));
        console.log("Sent data ", this.actuators)
    }

    OpenHandler(event) {
        console.log("I/O Server Connection made");
        this.client.send("Start");

        setInterval(self.DummyActuators, 1000);
    }

    Send(data) {
        this.client.send(JSON.stringify(data));
    }

    CloseHandler(event) {
        console.log("I/O server connection closed");
    }

    constructor(messageHandler) {
        this.actuators = {
            "vertical"  :0.0,
            "starboard" :0.0,
            "port"      :0.0,
            "lights"    :0.0
        }

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
        xhttp.open("GET", "?ioserver", true);
        xhttp.send();
    }
}
