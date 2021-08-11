import { video_toggle_cinema, video_exit_cinema } from './video.mjs';
import { light_toggle, armed_toggle } from './index.mjs';
import { actuators_set, actuators_get, actuators_send } from './actuators.mjs';

function handle_keyboard_input(key, value) {
    switch (key) {
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
                video_toggle_cinema();
            }
            break;
        case "l":
            if (value != 0.0)
            {   
                light_toggle();
            }
            break;
        case "Enter":
            if (value != 0.0)
            {                
                armed_toggle();  
            }
            break;
        case "Escape":
            if (value != 0.0)
            {             
                video_exit_cinema();
            }
            break;
    }
}

export function keyboard_init()
{
    window.addEventListener("keydown", (event) => handle_keyboard_input(event.key, actuators_get("sensitivity")));
    window.addEventListener("keyup",   (event) => handle_keyboard_input(event.key, 0.0));
}
