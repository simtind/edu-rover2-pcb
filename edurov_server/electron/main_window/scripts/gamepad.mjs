import { video_toggle_cinema } from './video.mjs';
import { light_toggle, armed_toggle } from './index.mjs';
import { actuators_set, actuators_send } from './actuators.mjs';
import { actuators_get } from './actuators.mjs';

var gamepadIndex;
var gamepadInterval;

var armed_pressed = false;
var light_pressed = false;
var cinema_pressed = false;

function button_pressed(b) 
{
    if (typeof(b) == "object") {
        return b.pressed;
    }
    return b == 1.0;
}

function read_gamepad() {
    const gamepads = navigator.getGamepads();
    if (gamepads.length <= gamepadIndex || gamepads[gamepadIndex] == null) {
        return;
    }

    const gamepad = gamepads[gamepadIndex];

    const armedButton = gamepad.buttons[3];
    const lightButton = gamepad.buttons[2];
    const cinemaButton = gamepad.buttons[1];

    const nJoyX = -gamepad.axes[2];
    const nJoyY = -gamepad.axes[3];

    var nMotPremixL = 0.0;
    var nMotPremixR = 0.0;

    // Differential Steering Joystick Algorithm below ported from:
    // https://www.impulseadventure.com/elec/robot-differential-steering.html

    // Calculate Drive Turn output due to Joystick X input
    if (nJoyY >= 0) {
        // Forward
        nMotPremixL = (nJoyX>=0)? 1.0 : (1.0 + nJoyX);
        nMotPremixR = (nJoyX>=0)? (1.0 - nJoyX) : 1.0;
    } else {
        // Reverse
        nMotPremixL = (nJoyX>=0)? (1.0 - nJoyX) : 1.0;
        nMotPremixR = (nJoyX>=0)? 1.0 : (1.0 + nJoyX);
    }

    // Scale Drive output due to Joystick Y input (throttle)
    nMotPremixL = nMotPremixL * nJoyY;
    nMotPremixR = nMotPremixR * nJoyY;

    // Now calculate pivot amount
    // - Strength of pivot (nPivSpeed) based on Joystick X input
    // - Blending of pivot vs drive (fPivScale) based on Joystick Y input
    const nPivSpeed = nJoyX;
    const fPivScale = (Math.abs(nJoyY)>0.3)? 0.0 : (1.0 - Math.abs(nJoyY)/0.3);

    // Calculate final mix of Drive and Pivot
    const nMotMixL = (1.0-fPivScale)*nMotPremixL + fPivScale*( nPivSpeed);
    const nMotMixR = (1.0-fPivScale)*nMotPremixR + fPivScale*(-nPivSpeed);

    // End of ported code

    const sensitivity = actuators_get("sensitivity");
    
    // Add dead-band so a centered joystick sends 0.
    actuators_set("starboard", Math.abs(nMotMixL) < 0.1 ? 0.0 : nMotMixL * sensitivity);
    actuators_set("port", Math.abs(nMotMixR) < 0.1 ? 0.0 : nMotMixR * sensitivity);
    actuators_set("vertical", Math.abs(gamepad.axes[1]) < 0.1 ? 0.0 : -gamepad.axes[1] * sensitivity);

    if (button_pressed(armedButton) && !armed_pressed) {
        armed_toggle();
    }
    armed_pressed = button_pressed(armedButton);

    if (button_pressed(lightButton) && !light_pressed) {
        light_toggle();
    }
    light_pressed = button_pressed(lightButton);

    if (button_pressed(cinemaButton) && !cinema_pressed) {
        video_toggle_cinema();
    }
    cinema_pressed = button_pressed(cinemaButton);


    actuators_send();
}

function connection_handler(event) {
    if (event.type == "gamepadconnected") {
        console.log("Gamepad connected at index %d: %s. %d buttons, %d axes.",
            event.gamepad.index, event.gamepad.id,
            event.gamepad.buttons.length, event.gamepad.axes.length);
        if (gamepadIndex != null)
        {
            console.log("Gamepad connect ignored.");
            return;
        }
        gamepadIndex = event.gamepad.index;

        gamepadInterval = setInterval(read_gamepad, 100);
    }
    else {
        if (gamepadIndex == event.gamepad.index) {
            console.log("Gamepad disconnected from index %d", gamepadIndex);
            gamepadIndex = null;
            clearInterval(gamepadInterval);
        }
    }
}

export function gamepad_init() {
    window.addEventListener("gamepadconnected", event => connection_handler(event), false);
    window.addEventListener("gamepaddisconnected", event => connection_handler(event), false);
}