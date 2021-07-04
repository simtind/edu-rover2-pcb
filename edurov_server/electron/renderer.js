var ipc = require('electron').ipcRenderer
import { video_enter_cinema, video_exit_cinema, video_rotate, video_update_size, video_init } from './video.js';

critical = {voltage:10.0, disk_space:500.0, cpu_temp:80.0};

function set_button_state(id, value)
{    
    var btn = document.getElementById(id);
    if(value){
        btn.className = btn.className.replace(" active", "");
    }else{
        btn.className += " active";
    }
}

function armed_toggle()
{
    ipc.send("armed-toggle");
}

function light_update() 
{
    var intensity_elm = document.getElementById("slider_headlight_intensity"); 
    var intensity = intensity_elm.value / intensity_elm.max;
    ipc.send("light-set", intensity);
}

function light_toggle(){
    var intensity_elm = document.getElementById("slider_headlight_intensity"); 
    var intensity = intensity_elm.value / intensity_elm.max;
    ipc.send("light-toggle", intensity);
}

function actuator_sensitivity_send()
{
    var intensity_elm = document.getElementById("slider_actuator_sensitivity"); 
    var intensity = intensity_elm.value / intensity_elm.max;
    ipc.send("sensitivity-set", intensity);
}

function update_frequency_set(){
    interval = prompt("Set sensor update interval in ms");
    if (interval){
        if (interval < 30){
            alert('Sensor frequency can not be less than 30 ms');
            interval = 30;
        }
        ipc.send("sensor_interval", interval);
    }
}

function roll_toggle(){
    set_button_state("button_toggle_roll", roll_ui);
    document.getElementById("rollOverlay").style.visibility = roll_ui ? "visible" : "hidden";
    roll_ui = !roll_ui;
}

function refresh_ui(sensors){
    var roll_val = sensors.roll
    document.getElementById("rollOverlay").style.transform =
        `rotate(${roll_val}deg)`;

    for (var key in sensors){
        var element = document.getElementById(key);
        if (element){
            var val = sensors[key];
            if (isNaN(val)){
                element.innerHTML = val;
            } else{
                element.innerHTML = val.toFixed(1);
            }
        }
    }

    // Check critical system values
    var voltElem = document.getElementById("voltageTr");
    var diskElem = document.getElementById("diskTr");
    var cpuElem = document.getElementById("cpuTr");
    if (sensors.batteryVoltage < critical.voltage){
        voltElem.className = " table-danger";
    } else{
        voltElem.className = voltElem.className.replace(" table-danger", "");
    }
    if (sensors.free_space < critical.disk_space){
        diskElem.className = " table-danger";
    } else{
        diskElem.className = diskElem.className.replace(" table-danger", "");
    }
    if (sensors.cpu_temp > critical.cpu_temp){
        cpuElem.className = " table-danger";
    } else{
        cpuElem.className = cpuElem.className.replace(" table-danger", "");
    }
}

document.getElementById("button_arm").onclick =                     function() { armed_toggle() };
document.getElementById("button_rotate_image").onclick =            function() { video_rotate(); };
document.getElementById("button_toggle_roll").onclick =             function() { roll_toggle() };
document.getElementById("button_enter_cinema").onclick =            function() { video_enter_cinema(); };
document.getElementById("button_set_update_frequency").onclick =    function() { update_frequency_set() };
document.getElementById("button_stop_rov").onclick =                function() { ipc.send("stop"); };
document.getElementById("button_toggle_light").onclick =            function() { light_toggle(); }
document.getElementById("slider_headlight_intensity").onchange =    function() { light_update(); };
document.getElementById("slider_actuator_sensitivity").onchange =   function() { actuator_sensitivity_send(); };
window.addEventListener("resize",                                   function() { video_update_size(); });

ipc.on(
    "sensors", 
    function (evt, message) 
    {
        sensors = JSON.parse(message);
        refresh_ui();
    }
);
ipc.on(
    'light', 
    function (evt, value) 
    {
        set_button_state("button_toggle_light", value > 0.0);
    }
);
ipc.on(
    'light-toggle', 
    function (evt) 
    {
        light_toggle();
    }
);
ipc.on(
    'armed', 
    function (evt, value) 
    {
        set_button_state("button_arm", value);
    }
);
ipc.on(
    'armed-toggle', 
    function (evt) 
    {
        armed_toggle();
    }
);

ipc.on(
    "video-start",     
    function(evt, address) 
    {        
        video_init(address);
    }
);
ipc.on("video-toggle-cinema", 
    function(evt)
    {
        video_toggle_cinema();
    }
);
ipc.on("video-exit-cinema", 
    function(evt)
    {
        video_exit_cinema();
    }
);

// Bootstrap websockets clients.
address = prompt("Please enter Raspberry PI address", "raspberrypi.local");
ipc.send("websockets-start", address);
