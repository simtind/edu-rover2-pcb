export class CameraClient {
    MINIMUM_PANEL_WIDTH = 250;
    pad = 10;
    cinema = false;
    frame = null;
    canvas = null;
    image = new Image();
    cinema_mode = false;

    OpenHandler(event) {
        console.log("Camera server connection made");
        this.canvas.style.display = "block";
        this.client.send("Start");
    }

    CloseHandler(event) {
        console.log("Camera server connection closed");
        this.canvas.style.display = "none";
    }

    MessageHandler(event) {
        var updateSize = this.image.src == "";
        this.image.src = event.data;
        if (updateSize) {
            this.SetSize();
        }
    }

    ErrorHandler(event) {
        console.log("Camera client experienced an error: " + event.data)
        this.client.close();
    }

    ToggleCinema(){
        if (!this.cinema_mode){
            var panels = document.getElementsByClassName("side-panel");
            panels[0].style.visibility = "visible";
            panels[1].style.visibility = "visible";
            var img = document.getElementsByClassName("center-panel")[0];
            img.style.position = "relative";
            img.style.width = "100%";
            img.style.marginLeft = "0";
        } else {
            var panels = document.getElementsByClassName("side-panel");
            panels[0].style.visibility = "hidden";
            panels[1].style.visibility = "hidden";
            var img = document.getElementsByClassName("center-panel")[0];
            img.style.position = "absolute";
        }
        this.cinema_mode = !this.cinema_mode
        this.SetSize();
    }

    SetSize(){
        var imgW = this.image.width;
        var imgH = this.image.height;
        var bodW = document.body.clientWidth;
        var bodH = document.body.clientHeight;
        var imgR = imgW / imgH;
        var bodR = bodW / bodH;
        var roll = document.getElementsByClassName("rollOverlay")[0];
        if (this.cinema){
            var img = document.getElementsByClassName("center-panel")[0];
            if (bodR > imgR){
                var new_width = bodH*imgR;
                var margin = (bodW-new_width)/2;
                img.style.marginLeft = margin.toString();
            } else {
                var new_width = bodW;
            }
            img.style.width = new_width.toString();
            roll.style.width = new_width.toString();

            var top = new_width/imgR/2*0.9;
            roll.style.top = top.toString();
        } else {
                var container =  document.getElementsByClassName("grid-container")[0];
            var imgDispW = (bodH - 2*this.pad)*imgR;
            var imgDispH = imgDispW / imgR;
            var panelW = Math.max(parseInt((bodW-2*this.pad-imgDispW)/2), this.MINIMUM_PANEL_WIDTH);
            container.style.gridTemplateColumns = `${panelW}px auto ${panelW}px`;

            var realImgW = bodW - 2*panelW - 2*this.pad;
            var realImhH = realImgW / imgR;
            this.canvas.style.width = realImgW;
            this.canvas.style.height = realImhH;

            roll.style.width = `${(bodW - 2*panelW - 2*this.pad)}px`;
            roll.style.top = `${realImhH/2}px`;
        }
    }

    Connect() {

        this.canvas = document.getElementById("stream_canvas");
        this.context = this.canvas.getContext("2d");

        var self = this;

        console.log("Starting camera server");
        // Get Camera Server address, and start websocket session
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                // Create WebSocket connection.
                self.client = new WebSocket(xhttp.responseText);
                console.log("Received camera server url", xhttp.responseText)
                self.client.addEventListener('open', function() {self.OpenHandler(event)});
                self.client.addEventListener('close', function() {self.CloseHandler(event);});
                self.client.addEventListener('error', function() {self.ErrorHandler(event);});
                self.client.addEventListener('message', function() {self.MessageHandler(event);});

                xhttp = null;
            }
        }
        xhttp.open("GET", "?cameraserver", true);
        xhttp.send();

        this.SetSize();

        window.addEventListener("resize", function () {self.SetSize()});
        this.image.onload = function () { self.context.drawImage(self.image, 0, 0, self.canvas.width, self.canvas.height);};
    }

    constructor() {
        var self = this;
        // document.addEventListener("DOMContentLoaded", function(){self.Connect();});
        this.Connect()
    }
}
