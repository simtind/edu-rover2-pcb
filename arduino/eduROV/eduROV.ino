#include "config.h"

String make_sensor_string(int count, ...) {
    va_list ap;
    String out_string = "";

    va_start(ap, count); /* Requires the last fixed parameter (to get the address) */
    for (int i = 0; i < count; i++) {
        out_string += String(va_arg(ap, int16_t)) + ","; /* Increments ap to the next argument. */
    }
    va_end(ap);

    return out_string.substring(0, out_string.length() - 1);
}
String make_actuator_string(int count, ...) {
    va_list ap;
    String out_string = "Got actuators: ";

    va_start(ap, count); /* Requires the last fixed parameter (to get the address) */
    for (int i = 0; i < count; i++) {
        out_string += String(va_arg(ap, int)) + ","; /* Increments ap to the next argument. */
    }
    va_end(ap);

    return out_string.substring(0, out_string.length() - 1);
}

void set_motor_thrust(int dir_pin, int pwm_pin, bool dir_val, int thrust)
{
  if (thrust == 0)
  {
    digitalWrite(dir_pin, 0);
    digitalWrite(pwm_pin, 0);
  }
  else
  {
    digitalWrite(dir_pin, dir_val);
    analogWrite(pwm_pin, MOTOR_PWM_VAL(thrust, dir_val));
  }
}

void setup() {
  // put your setup code here, to run once:
  
  pinMode(PIN_LED_PWM, OUTPUT);
  pinMode(PIN_MOTOR_ENABLE, OUTPUT);
  pinMode(PIN_MOTOR1_PWM, OUTPUT);
  pinMode(PIN_MOTOR1_DIR, OUTPUT);
  pinMode(PIN_MOTOR2_PWM, OUTPUT);
  pinMode(PIN_MOTOR2_DIR, OUTPUT);
  pinMode(PIN_MOTOR3_PWM, OUTPUT);
  pinMode(PIN_MOTOR3_DIR, OUTPUT);
  pinMode(PIN_MOTOR4_PWM, OUTPUT);
  pinMode(PIN_MOTOR4_DIR, OUTPUT);
  
  digitalWrite(PIN_LED_PWM, 0);
  digitalWrite(PIN_LED_PWM, 0);
  digitalWrite(PIN_MOTOR_ENABLE, 0);
  digitalWrite(PIN_MOTOR1_PWM, 0);
  digitalWrite(PIN_MOTOR1_DIR, 0);
  digitalWrite(PIN_MOTOR2_PWM, 0);
  digitalWrite(PIN_MOTOR2_DIR, 0);
  digitalWrite(PIN_MOTOR3_PWM, 0);
  digitalWrite(PIN_MOTOR3_DIR, 0);
  digitalWrite(PIN_MOTOR4_PWM, 0);
  digitalWrite(PIN_MOTOR4_DIR, 0);
  
  Serial1.begin(115200);
  Serial.begin(115200);

  Serial1.println("EduROV Arduino start"); 
  Serial.println("EduROV Arduino debug start"); 
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t messageTime = 0;
  static uint32_t sensor_interval = 500; //how long between each sensor update - milliseconds
  Serial1.setTimeout(sensor_interval - 10);

  int16_t starboard_thrust = 0;
  int16_t port_thrust = 0;
  int16_t vertical_thrust = 0;
  int16_t led_power = 0;
  uint32_t new_sensor_interval = 0;
  bool update_actuators = false;
  
  if ((millis() - messageTime) > sensor_interval) {
    messageTime = millis();
    
    // All ADC measurements are multiplied by 100 to report 2-decimal precision numbers where possible
    
    int16_t motor1_current = MOTOR_ADC_TO_mA(analogRead(PIN_SENSE_MOTOR1));
    int16_t motor2_current = MOTOR_ADC_TO_mA(analogRead(PIN_SENSE_MOTOR2));
    int16_t motor3_current = MOTOR_ADC_TO_mA(analogRead(PIN_SENSE_MOTOR3));
    int16_t motor4_current = MOTOR_ADC_TO_mA(analogRead(PIN_SENSE_MOTOR4));
    
    int16_t battery =     BATTERY_ADC_TO_VOLT    (analogRead(PIN_SENSE_BATTERY));
    int16_t pressure =    PRESSURE_ADC_TO_KPA    (analogRead(PIN_SENSE_PRESSURE));
    int16_t temperature = TEMPERATURE_ADC_TO_DEGC(analogRead(PIN_SENSE_TEMPERATURE));

    auto sensors = 
      make_sensor_string(7, 
        battery, 
        pressure, 
        temperature, 
        motor1_current, 
        motor2_current, 
        motor3_current, 
        motor4_current
      );
  
    Serial.println(sensors);
    Serial1.println(sensors);
  }

  String indata = Serial1.readStringUntil('\n');

  if (indata.length() > 1)
  {
    Serial.println(indata); 
  }
  
  update_actuators |= sscanf(
    indata.c_str(), 
    "star=%i port=%i vert=%i light=%i", 
    &starboard_thrust, 
    &port_thrust, 
    &vertical_thrust, 
    &led_power
  ) == 4;
  
  if (update_actuators)
  {
    Serial.println(
      make_actuator_string(4,
        starboard_thrust, 
        port_thrust, 
        vertical_thrust, 
        led_power
      )
    );
  
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
    return;
  }
  
  bool update_interval = sscanf(indata.c_str(), "interval=%lu", &new_sensor_interval) == 1;
  if (update_interval)
  {
    sensor_interval = new_sensor_interval;
    Serial1.setTimeout(sensor_interval - 10);
    Serial.println("Interval = " + sensor_interval);
    return;
  }
}
