export class CameraClient {
    MINIMUM_PANEL_WIDTH = 250;
    video_rotation = 0;
    pad = 10;
    frame = null;
    canvas = null;
    image = new Image();
    cinema_mode = false;

    RotateVideo(){
        this.video_rotation += 180;
        this.canvas.style.transform = `rotate(${this.video_rotation}deg)`;
    }

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
        this.image.src = event.data;
        //this.SetSize();
    }

    ErrorHandler(event) {
        console.log("Camera client experienced an error: " + event.data)
        this.client.close();
    }

    ToggleCinema() {
        if (this.cinema_mode) {
            this.ExitCinema();
        }
        else {
            this.EnterCinema();
        }
    }

    EnterCinema(){
        if (this.cinema_mode){
            return;
        }

        var panels = document.getElementsByClassName("side-panel");
        panels[0].style.visibility = "hidden";
        panels[1].style.visibility = "hidden";
        panels[0].style.width = "0px";
        panels[1].style.width = "0px";
        panels[0].style.minWidth = "0px";
        panels[1].style.minWidth = "0px";

        this.cinema_mode = true;
        this.SetSize();
    }

    ExitCinema(){
        if (!this.cinema_mode){
            return;
        }

        var panels = document.getElementsByClassName("side-panel");
        panels[0].style.visibility = "visible";
        panels[1].style.visibility = "visible";
        panels[0].style.width = "300px";
        panels[1].style.width = "300px";
        panels[0].style.minWidth = "300px";
        panels[1].style.minWidth = "300px";

        this.cinema_mode = false;
        this.SetSize();
    }

    SetSize(){
        var panels = document.getElementsByClassName("side-panel");
        var roll = document.getElementById("rollOverlay");
        var margin = 20;
        var bodyWidth = document.body.clientWidth;
        var bodyHeight = document.body.clientHeight;
        var aspectRatio = this.image.naturalWidth / this.image.naturalHeight;
        if (isNaN(aspectRatio)) {
            aspectRatio = 16/9; // Default to 16/9 aspect ratio
        }
        var availableWidth = bodyWidth - margin;
        if (panels[0].style.visible != "hidden"){
            availableWidth -= panels[0].offsetWidth;
        }
        if (panels[1].style.visible != "hidden"){
            availableWidth -= panels[1].offsetWidth;
        }
        var availableHeight = bodyHeight - margin;
        if (availableWidth / aspectRatio > availableHeight) {
            availableWidth = availableHeight * aspectRatio;
        }
        this.canvas.width  = availableWidth;
        this.canvas.height = availableWidth / aspectRatio;
        roll.style.top = this.canvas.height / 2;
    }

    Connect() {

        this.canvas = document.getElementById("streamCanvas");
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
        xhttp.open("GET", "/cameraserver", true);
        xhttp.send();

        this.SetSize();

        window.addEventListener("resize", function () {self.SetSize()});
        this.image.onload = function () { self.context.drawImage(self.image, 0, 0, self.canvas.width, self.canvas.height);};
    }

    constructor() {
        var self = this;
        this.Connect()
    }
}