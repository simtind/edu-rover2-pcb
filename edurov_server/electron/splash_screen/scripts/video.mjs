
var cinema_mode = false;
var video_rotation = 0;
var image = new Image();
var cinema_mode = false;
var canvas = null;
var context = null;


export function video_update_size()
{
    if (!canvas)
    {
        return;
    }

    var panels = document.getElementsByClassName("side-panel");
    var roll = document.getElementById("rollOverlay");
    var margin = 20;
    var bodyWidth = document.body.clientWidth;
    var bodyHeight = document.body.clientHeight;
    var aspectRatio = image.naturalWidth / image.naturalHeight;
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
    canvas.width  = availableWidth;
    canvas.height = availableWidth / aspectRatio;
    roll.style.top = canvas.height / 2;
}

export function video_rotate()
{
    if (!canvas)
    {
        return;
    }
    
    video_rotation += 180;
    canvas.style.transform = `rotate(${video_rotation}deg)`;
}

export function video_toggle_cinema()
{
    if (cinema_mode)
    {
        return video_exit_cinema();
    }
    else
    {
        return video_enter_cinema();
    }
}

export function video_enter_cinema()
{
    if (!cinema_mode)
    {
        var panels = document.getElementsByClassName("side-panel");
        panels[0].style.visibility = "hidden";
        panels[1].style.visibility = "hidden";
        panels[0].style.width = "0px";
        panels[1].style.width = "0px";
        panels[0].style.minWidth = "0px";
        panels[1].style.minWidth = "0px";
        cinema_mode = true;
        video_update_size();
    }
    return cinema_mode;
}

export function video_exit_cinema()
{
    if (cinema_mode)
    {
        var panels = document.getElementsByClassName("side-panel");
        panels[0].style.visibility = "visible";
        panels[1].style.visibility = "visible";
        panels[0].style.width = "300px";
        panels[1].style.width = "300px";
        panels[0].style.minWidth = "300px";
        panels[1].style.minWidth = "300px";
        cinema_mode = false;
        video_update_size();
    }
}

export function video_init(address)
{
    canvas = document.getElementById("streamCanvas");
    context = canvas.getContext("2d");
    
    image.onload = function () 
    { 
        context.drawImage(image, 0, 0, canvas.width, canvas.height);
    };
    
    var client = new WebSocket(address);
    console.log("Received camera server url", address)
    client.addEventListener(
        'open', 
        function(event) {
            console.log("Camera server connection made");
            canvas.style.display = "block";
            client.send("Start");
        }
    );
    client.addEventListener(
        'close', 
        function(event) 
        {
            console.log("Camera server connection closed");
            canvas.style.display = "none";
        }
    );
    client.addEventListener(
        'error', 
        function(event) 
        {
            console.log("Camera client experienced an error: " + event.data)
            client.close();
        }
    );
    client.addEventListener(
        'message', 
        function(event) 
        {
            image.src = event.data;
        }
    );
}