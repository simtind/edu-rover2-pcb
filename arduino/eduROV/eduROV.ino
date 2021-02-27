#include "config.h"

String make_sensor_string(int count, ...) {
    va_list ap;
    String out_string = "";

    va_start(ap, count); /* Requires the last fixed parameter (to get the address) */
    for (int i = 0; i < count; i++) {
        out_string += String(va_arg(ap, int)) + ","; /* Increments ap to the next argument. */
    }
    va_end(ap);

    return out_string.substring(0, out_string.length() - 1);
}

void set_motor_thrust(int dir_pin, int pwm_pin, bool dir_val, int thrust)
{
  digitalWrite(dir_pin, dir_val);
  if (thrust == 0)
  {
    digitalWrite(pwm_pin, 0);
  }
  else
  {
    analogWrite(pwm_pin, map(abs(thrust), 0, 1000, 0, 256));
  }
}

void setup() {
  // put your setup code here, to run once:
  
  digitalWrite(PIN_LED_PWM, 0);
  digitalWrite(PIN_MOTOR1_PWM, 0);
  digitalWrite(PIN_MOTOR1_DIR, 0);
  digitalWrite(PIN_MOTOR2_PWM, 0);
  digitalWrite(PIN_MOTOR2_DIR, 0);
  digitalWrite(PIN_MOTOR3_PWM, 0);
  digitalWrite(PIN_MOTOR3_DIR, 0);
  digitalWrite(PIN_MOTOR4_PWM, 0);
  digitalWrite(PIN_MOTOR4_DIR, 0);
  
  Serial.begin(115200);

  Serial.println("EduROV Arduino start"); 
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t messageTime = 0;
  static uint32_t sensor_interval = 500; //how long between each sensor update - milliseconds
  
  if ((millis() - messageTime) > sensor_interval) {
    messageTime = millis();
    
    // All ADC measurements are multiplied by 100 to report 2-decimal precision numbers where possible
    
    int32_t motor1_current = MOTOR_ADC_TO_AMP(analogRead(PIN_SENSE_MOTOR1)) * 100;
    int32_t motor2_current = MOTOR_ADC_TO_AMP(analogRead(PIN_SENSE_MOTOR2)) * 100;
    int32_t motor3_current = MOTOR_ADC_TO_AMP(analogRead(PIN_SENSE_MOTOR3)) * 100;
    int32_t motor4_current = MOTOR_ADC_TO_AMP(analogRead(PIN_SENSE_MOTOR4)) * 100;
    
    int32_t battery =     BATTERY_ADC_TO_VOLT    (analogRead(PIN_SENSE_BATTERY)) * 100;
    int32_t pressure =    PRESSURE_ADC_TO_KPA    (analogRead(PIN_SENSE_PRESSURE)) * 100;
    int32_t temperature = TEMPERATURE_ADC_TO_DEGC(analogRead(PIN_SENSE_TEMPERATURE)) * 100;
  
    Serial.println(
      make_sensor_string(7, 
        battery, 
        pressure, 
        temperature, 
        motor1_current, 
        motor2_current, 
        motor3_current, 
        motor4_current
      )
    );
  }

  String indata = Serial.readStringUntil('\n');

  int32_t starboard_thrust = 0;
  int32_t port_thrust = 0;
  int32_t vertical_thrust = 0;
  int32_t led_power = 0;
  uint32_t new_sensor_interval = 0;

  int res = sscanf(
    indata.c_str(), 
    "interval=%lu", 
    &new_sensor_interval
  );

  if (res == 1)
  {
    sensor_interval = new_sensor_interval;
  }
  
  res = sscanf(
    indata.c_str(), 
    "%li, %li, %li, %li", 
    &starboard_thrust, 
    &port_thrust, 
    &vertical_thrust, 
    &led_power
  );
  if (res != 4)
  {
    // Skip applying power if we didn't get any data.
    return;
  }

  digitalWrite(PIN_MOTOR_ENABLE, 1);

  set_motor_thrust(
    PIN_MOTOR1_DIR, 
    PIN_MOTOR1_PWM, 
    MOTOR1_DIR_VAL(starboard_thrust), 
    starboard_thrust
  );
  set_motor_thrust(
    PIN_MOTOR2_DIR, 
    PIN_MOTOR2_PWM, 
    MOTOR2_DIR_VAL(port_thrust), 
    port_thrust
  );
  set_motor_thrust(
    PIN_MOTOR3_DIR, 
    PIN_MOTOR3_PWM, 
    MOTOR3_DIR_VAL(vertical_thrust), 
    vertical_thrust
  );
  set_motor_thrust(
    PIN_MOTOR4_DIR, 
    PIN_MOTOR4_PWM, 
    MOTOR4_DIR_VAL(vertical_thrust), 
    vertical_thrust
  );

  analogWrite(PIN_LED_PWM, led_power);  
}
