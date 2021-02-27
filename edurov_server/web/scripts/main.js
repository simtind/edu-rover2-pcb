import { CameraClient } from './cameraclient.js';
import { IOClient }     from './ioclient.js';
import { KeyBoard }     from './keyboard.js';
import { GamePad }      from './gamepad.js';

/**
 * Handles sensor values and some simple GUI updates
 * https://github.com/trolllabs/eduROV
 */

 class Main {

    stat = {armed:false, roll_ui:true, cinema:false, video_rotation:0};
    sensors = {time:0, temp:0, pressure:0, humidity:0, pitch:0, roll:0, yaw:0,
                tempWater:0, pressureWater:0, batteryVoltage:0, free_space:0,
                cpu_temp:0};
    critical = {voltage:10.0, disk_space:500.0, cpu_temp:80.0};

    actuators = {vertical:0.0, port:0.0, starboard:0.0, lights:0.0, sensor_interval:500}

    constructor() {
        var self = this;
        this.io = new IOClient(function(event) { self.SensorHandler(event) });
        this.camera = new CameraClient();
        this.keyboard = new KeyBoard(this);
        this.gamepads = new GamePad(this);

        document.getElementById("button_arm").onclick =                  function() { self.ToggleArmed() };
        document.getElementById("button_rotate_image").onclick =         function() { self.camera.RotateVideo() };
        document.getElementById("button_toggle_roll").onclick =          function() { self.ToggleRoll() };
        document.getElementById("button_enter_cinema").onclick =         function() { self.camera.EnterCinema() };
        document.getElementById("button_set_update_frequency").onclick = function() { self.SetUpdateFrequency() };
        document.getElementById("button_toggle_light").onclick =         function() { self.ToggleLight(); self.PostActuators(); }
        document.getElementById("button_stop_rov").onclick =             function() { self.KillRov() };
    }

    SensorHandler(event) {
        this.sensors = JSON.parse(event.data);
        this.RefreshUI();
    }

    SetActuator(name, value) {
        this.actuators[name] = value;
    }

    ToggleLight(){
        var btn = document.getElementById("button_toggle_light");
        if(this.actuators['lights'] == 1.0){
            btn.className = btn.className.replace(" active", "");
        }else{
            btn.className += " active";
        }
        this.actuators['lights'] = this.actuators['lights'] == 1.0 ? 0.0 : 1.0;
    }

    ToggleCinema(){
        this.camera.ToggleCinema();
    }

    ExitCinema(){
        this.camera.ExitCinema();
    }

    ToggleArmed(){
        var btn = document.getElementById("button_arm");
        if(this.stat.armed){
            btn.className = btn.className.replace(" active", "");
        }else{
            btn.className += " active";
        }
        this.stat.armed = !this.stat.armed;
        this.RefreshUI();
    }

    SetUpdateFrequency(interval){
        var interval = prompt("Set sensor update interval in ms", this.actuators["sensor_interval"]);
        if (interval){
            if (interval < 30){
                alert('Sensor frequency can not be less than 30 ms');
                interval = 30;
            }
            this.actuators["sensor_interval"] = interval;
        }
    }

    ToggleRoll(){
        var btn = document.getElementById("button_toggle_roll");
        if(this.stat.roll_ui){
            document.getElementById("rollOverlay").style.visibility = "hidden";
            btn.className = btn.className.replace(" active", "");
        }else{
            document.getElementById("rollOverlay").style.visibility = "visible";
            btn.className += " active";
        }
        this.stat.roll_ui = !this.stat.roll_ui;
    }

    KillRov(){
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/stop", true);
        xhttp.setRequestHeader("Content-Type", "application/text");
        xhttp.send();
    }

    RefreshUI(){
        var roll_val = this.sensors.roll
        document.getElementById("rollOverlay").style.transform =
            `rotate(${roll_val}deg)`;

        for (var key in this.sensors){
            var element = document.getElementById(key);
            if (element){
                var val = this.sensors[key];
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
        if (this.sensors.batteryVoltage < this.critical.voltage){
            voltElem.className = " table-danger";
        } else{
            voltElem.className = voltElem.className.replace(" table-danger", "");
        }
        if (this.sensors.free_space < this.critical.disk_space){
            diskElem.className = " table-danger";
        } else{
            diskElem.className = diskElem.className.replace(" table-danger", "");
        }
        if (this.sensors.cpu_temp > this.critical.cpu_temp){
            cpuElem.className = " table-danger";
        } else{
            cpuElem.className = cpuElem.className.replace(" table-danger", "");
        }
    }

    PostActuators(){
        this.io.Send(this.actuators);
    }
}

const main = new Main();