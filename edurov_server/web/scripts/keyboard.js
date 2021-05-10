var keycodes = {l:76, c:67, esc:27, enter:13, w:87, a:65, s:83, d:68, q:81, e:69};

export class KeyBoard {

    KeyDownHandler(evt) {
        var sensitivity_elm = document.getElementById("slider_actuator_sensitivity");
        var sensitivity = sensitivity_elm.value / sensitivity_elm.max; 
        evt = evt || window.event;
        switch (evt.keyCode) {
            case keycodes.q:
                this.main.actuators["port"] = sensitivity;
                this.main.PostActuators();
                break;
            case keycodes.w:
                this.main.SetActuator("vertical", sensitivity);
                this.main.PostActuators();
                break;
            case keycodes.e:
                this.main.SetActuator("starboard", sensitivity);
                this.main.PostActuators();
                break;
            case keycodes.a:
                this.main.SetActuator("port", -sensitivity);
                this.main.PostActuators();
                break;
            case keycodes.s:
                this.main.SetActuator("vertical", -sensitivity);
                this.main.PostActuators();
                break;
            case keycodes.d:
                this.main.SetActuator("starboard", -sensitivity);
                this.main.PostActuators();
                break;
            case keycodes.l:
                this.main.ToggleLight();
                this.main.PostActuators();
                break;
            case keycodes.enter:
                this.main.ToggleArmed();
            case keycodes.esc:
                this.main.ExitCinema();
                break;
            case keycodes.c:
                this.main.ToggleCinema();
                break;
        }
    }

    KeyUpHandler(evt) {
        switch (evt.keyCode) {
            case keycodes.q:
                this.main.SetActuator("port", 0.0);
                this.main.PostActuators();
                break;
            case keycodes.w:
                this.main.SetActuator("vertical", 0.0);
                this.main.PostActuators();
                break;
            case keycodes.e:
                this.main.SetActuator("starboard", 0.0);
                this.main.PostActuators();
                break;
            case keycodes.a:
                this.main.SetActuator("port", 0.0);
                this.main.PostActuators();
                break;
            case keycodes.s:
                this.main.SetActuator("vertical", 0.0);
                this.main.PostActuators();
                break;
            case keycodes.d:
                this.main.SetActuator("starboard", 0.0);
                this.main.PostActuators();
                break;
        }
    }

    constructor(main) {
        this.main = main;
        var self = this;
        document.onkeydown = function(event) {self.KeyDownHandler(event) };
        document.onkeyup = function(event) {self.KeyUpHandler(event) };
    }
}

