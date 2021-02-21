export class GamePad {
    gamepadIndex;
    gamepadInterval;

    armed_pressed = false;
    light_pressed = false;
    cinema_pressed = false;

    skip_send = true;

    sensitivity = 0.4;

    ButtonPressed(b) {
        if (typeof(b) == "object") {
            return b.pressed;
        }
        return b == 1.0;
    }

    PollGamepad() {
        var gamepads = navigator.getGamepads();
        if (gamepads.length <= gamepadIndex || gamepads[gamepadIndex] == null) {
            return;
        }

        var gamepad = gamepads[gamepadIndex];

        var armedButton = gamepad.buttons[3];
        var lightButton = gamepad.buttons[2];
        var cinemaButton = gamepad.buttons[1];

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
        var fPivScale = (Math.abs(nJoyY)>0.3)? 0.0 : (1.0 - Math.abs(nJoyY)/0.3);

        // Calculate final mix of Drive and Pivot
        nMotMixL = (1.0-fPivScale)*nMotPremixL + fPivScale*( nPivSpeed);
        nMotMixR = (1.0-fPivScale)*nMotPremixR + fPivScale*(-nPivSpeed);

        // Add dead-band so a centered joystick sends 0.
        main.SetActuator("port",      Math.abs(nMotMixL) < 0.1 ? 0.0 : nMotMixL);
        main.SetActuator("starboard", Math.abs(nMotMixR) < 0.1 ? 0.0 : nMotMixR);
        main.SetActuator("vertical",  Math.abs(gamepad.axes[1]) < 0.1 ? 0.0 : -gamepad.axes[1]);

        // End of ported code

        if (buttonPressed(armedButton) && !armed_pressed) {
            main.toggle_armed();
        }
        armed_pressed = buttonPressed(armedButton);

        if (buttonPressed(lightButton) && !light_pressed) {
            main.toggle_light();
        }
        light_pressed = buttonPressed(lightButton);

        if (buttonPressed(cinemaButton) && !cinema_pressed) {
            main.toggle_cinema();
        }
        cinema_pressed = buttonPressed(cinemaButton);

        main.PostActuators();
    }

    GamepadHandler(event) {
        if (event.type == "gamepadconnected") {
            console.log("Gamepad connected at index %d: %s. %d buttons, %d axes.",
                event.gamepad.index, event.gamepad.id,
                event.gamepad.buttons.length, event.gamepad.axes.length);
            if (this.gamepadIndex != null)
            {
                console.log("Gamepad connect ignored.");
                return;
            }
            this.gamepadIndex = event.gamepad.index;

            this.gamepadInterval = setInterval(this.PollGamepad, 100);
        }
        else {
            if (gamepadIndex == event.gamepad.index) {
                console.log("Gamepad disconnected from index %d", gamepadIndex);
                gamepadIndex = null;
                this.clearInterval(gamepadInterval);
            }
        }
    }

    constructor(main) {
        var self = this;
        this.main = main;

        window.addEventListener("gamepadconnected", event => self.GamepadHandler(event), false);
        window.addEventListener("gamepaddisconnected", event => self.GamepadHandler(event), false);
    }
}