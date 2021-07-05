const { actuators_set, actuators_send } = require('./actuators.js');


function handle_keyboard_input(event) {
    var sensitivity_elm = document.getElementById("slider_actuator_sensitivity");
    var sensitivity = sensitivity_elm.value / sensitivity_elm.max; 
    evt = evt || window.event;
    value = event.type == "keyUp" ? 0.0 : sensitivity;
    switch (evt.key) {
        case "q":
            actuators_set("port", value);
            actuators_send();
            break;
        case "w":
            actuators_set("vertical", value);
            actuators_send();
            break;
        case "e":
            actuators_set("starboard", value);
            actuators_send();
            break;
        case "a":
            actuators_set("port", -value);
            actuators_send();
            break;
        case "s":
            actuators_set("vertical", -value);
            actuators_send();
            break;
        case "d":
            actuators_set("starboard", -value);
            actuators_send();
            break;
        case "c":
            if (value != 0.0)
            {                
                window.webContents.send('video-toggle-cinema');
            }
            break;
        case "l":
            if (value != 0.0)
            {                
                window.webContents.send('light-toggle');
            }
            break;
        case "Enter":
            if (value != 0.0)
            {                
                window.webContents.send('armed-toggle');
            }
            break;
        case "Escape":
            if (value != 0.0)
            {                
                window.webContents.send('video-exit-cinema');
            }
            break;
    }
}

function keyboard_init(window)
{    
    window.webContents.on("before-input-event", handle_keyboard_input);
}

module.exports = { keyboard_init }