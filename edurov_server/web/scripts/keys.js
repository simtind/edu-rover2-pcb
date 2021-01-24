/**
 * Handles keydown and keyup events
 * If not handle_in_browser it sends the event to the server
 * https://github.com/trolllabs/eduROV
 */

var last_key;

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode != last_key){
        last_key = evt.keyCode;
        if (MOTOR_KEYS.indexOf(evt.keyCode) > -1 && !stat.armed){
            if (confirm("The ROV is not armed, do you want to arm it?")) {
                toggle_armed();
            }
        }
        var shouldUpdateActuators = false;
        switch (evt.KeyCode) {
            case keycodes.q:
                actuators["port"] = 1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.w:
                actuators["vertical"] = 1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.e:
                actuators["starboard"] = 1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.a:
                actuators["port"] = -1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.s:
                actuators["vertical"] = -1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.d:
                actuators["starboard"] = -1.0;
                shouldUpdateActuators = true;
                break;
            case keycodes.l:
                toggle_light();
                shouldUpdateActuators = true;
                break;
            case keycodes.enter:
                toggle_armed();
            case keycodes.esc:
                if (stat.cinema){
                    toggle_cinema();
                }
                break;
            case keycodes.c:
                toggle_cinema();
                break;
        }

        if (shouldUpdateActuators) {
            postActuators();
        }
    }
}

document.onkeyup = function(evt) {
    var shouldUpdateActuators = false;
    switch (evt.KeyCode) {
        case keycodes.q:
            actuators["port"] = 0.0;
            shouldUpdateActuators = true;
            break;
        case keycodes.w:
            actuators["vertical"] = 0.0;
            shouldUpdateActuators = true;
            break;
        case keycodes.e:
            actuators["starboard"] = 0.0;
            shouldUpdateActuators = true;
            break;
        case keycodes.a:
            actuators["port"] = 0.0;
            shouldUpdateActuators = true;
            break;
        case keycodes.s:
            actuators["vertical"] = 0.0;
            shouldUpdateActuators = true;
            break;
        case keycodes.d:
            actuators["starboard"] = 0.0;
            shouldUpdateActuators = true;
            break;
    }

    if (shouldUpdateActuators) {
        postActuators();
    }
}
