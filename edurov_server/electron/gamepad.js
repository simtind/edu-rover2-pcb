const { GamepadListener } = require('gamepad.js');
import { actuators_set, actuators_send } from './actuators.js';

armed_pressed = false;
light_pressed = false;
cinema_pressed = false;
listener = null;

function read_axes(gamepad) {

    var nJoyX = -gamepad.axes[2];
    var nJoyY = -gamepad.axes[3];
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
    var nPivSpeed = nJoyX;
    var fPivScale = 1.0 - Math.abs(nJoyY)/0.3;

    // Calculate final mix of Drive and Pivot
    nMotMixL = (1.0-fPivScale)*nMotPremixL + fPivScale*( nPivSpeed);
    nMotMixR = (1.0-fPivScale)*nMotPremixR + fPivScale*(-nPivSpeed);
    // End of ported code

    // Add dead-band so a centered joystick sends 0.
    actuators_set("port", nMotMixL);
    actuators_set("starboard", nMotMixR);
    actuators_set("vertical",  -gamepad.axes[1]);
    actuators_send();
}

function select_gamepad(index)
{
    const selector = "gamepad:" + index;

    listener.on(selector + ':axis', function (event) {
        read_axes(event.gamepad);
    });
    
    listener.on(selector + ':button:3',  
        function (event) 
        { 
            if (event.pressed && !armed_pressed) 
            {
                window.webContents.send('armed-toggle');
            }
            armed_pressed = event.pressed;
        }
    );
    
    listener.on(selector + ':button:2',  
        function (event) 
        { 
            if (event.pressed && !lightButton) 
            {
                window.webContents.send('light-toggle');
            }
            lightButton = event.pressed;
        }
    );
    
    listener.on(selector + ':button:1',  
        function (event) 
        { 
            if (event.pressed && !cinemaButton) 
            {
                window.webContents.send('video-toggle-cinema');
            }
            cinemaButton = event.pressed;
        }
    );    
}

function deselect_gamepad(index)
{
    const selector = "gamepad:" + index;

    listener.removeListener(selector + ':axis');
    listener.removeListener(selector + ':button:3');        
    listener.removeListener(selector + ':button:2');
    listener.removeListener(selector + ':button:1');    
}

function gamepad_init(window) {
    listener = new GamepadListener(
        {
            button: 
            {
                analog: false
            },
            stick: 
            {
                precision: 2,
                deadZone: 0.1
            }
        }
    );
    listener.on('gamepad:connected',  function (event) {
        console.log("Gamepad connected at index %d: %s. %d buttons, %d axes.",
            event.gamepad.index, event.gamepad.id,
            event.gamepad.buttons.length, event.gamepad.axes.length);
        if (gamepadIndex != null)
        {
            console.log("Gamepad connect ignored.");
            return;
        }
        gamepadIndex = event.gamepad.index;
        select_gamepad(gamepadIndex);
    });
    
    listener.on('gamepad:disconnected',  function (event) {
        if (gamepadIndex == event.gamepad.index) {
            console.log("Gamepad disconnected from index %d", gamepadIndex);
            gamepadIndex = null;
            deselect_gamepad(gamepadIndex)
        }
    });    
    
    listener.start();
}