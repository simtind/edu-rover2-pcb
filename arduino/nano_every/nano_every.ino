#include "../config.h"
#include <ArduinoJson.h>

StaticJsonDocument<256> sensors;

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

  sensors["motor1_current"]    = 0.0;
  sensors["motor2_current"]    = 0.0;
  sensors["motor3_current"]    = 0.0;
  sensors["motor4_current"]    = 0.0;
  sensors["battery"]           = 0.0;
  sensors["water_pressure"]    = 0.0;
  sensors["water_temperature"] = 0.0;
  
  Serial1.begin(115200);
  Serial.begin(115200);

  Serial1.println("EduROV Arduino start"); 
  Serial.println("EduROV Arduino debug start"); 
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t messageTime = 0;
  static uint32_t sensor_interval = 500; //how long between each sensor update - milliseconds
  static String indata = "";

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
    
    sensors["motor1_current"]    = MOTOR_ADC_TO_A(analogRead(PIN_SENSE_MOTOR1));
    sensors["motor2_current"]    = MOTOR_ADC_TO_A(analogRead(PIN_SENSE_MOTOR2));
    sensors["motor3_current"]    = MOTOR_ADC_TO_A(analogRead(PIN_SENSE_MOTOR3));
    sensors["motor4_current"]    = MOTOR_ADC_TO_A(analogRead(PIN_SENSE_MOTOR4));  
    sensors["battery"]           = BATTERY_ADC_TO_VOLT    (analogRead(PIN_SENSE_BATTERY));
    sensors["water_pressure"]    = PRESSURE_ADC_TO_KPA    (analogRead(PIN_SENSE_PRESSURE));
    sensors["water_temperature"] = TEMPERATURE_ADC_TO_DEGC(analogRead(PIN_SENSE_TEMPERATURE));

    serializeJson(sensors, Serial);
    Serial.println("");
  }

  if (Serial1.available()) {
    indata += Serial.read();
  }

  if (indata.endsWith('\n')) {
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
}
