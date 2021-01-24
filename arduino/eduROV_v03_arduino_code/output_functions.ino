// Output settings
volatile int vertical = 0;
volatile int starboard = 0;
volatile int port = 0;
volatile int lights = 0;
volatile bool updateBChannel = true;

// Output handler function, implements soft PWM across all motor outputs
void updateOutput() {
  int period = (millis() % 1000) / 10;
  static bool vertical_active   = false;
  static bool port_active       = false;
  static bool starboard_active  = false;
  static int vertical_cached   = 0;
  static int port_cached       = 0;
  static int starboard_cached  = 0;

  if (period == 0)
  {
    // Update local cache of state data once every full period so we don't 
    // get glitches when the output value is updated.
    vertical_cached   = vertical;
    port_cached       = port;
    starboard_cached  = starboard;

    if (updateBChannel) {
      updateBChannel = false;
      digitalWrite(ch1b, vertical_cached  >= 0 ? HIGH : LOW);
      digitalWrite(ch2b, vertical_cached  >= 0 ? HIGH : LOW);

      digitalWrite(ch3b, port_cached  >= 0 ? HIGH : LOW);

      digitalWrite(ch4b, starboard_cached  >= 0 ? HIGH : LOW);

      if (vertical_cached == 0) {
        digitalWrite(ch1a, HIGH);
        digitalWrite(ch2a, HIGH);
      }
    
      if (port_cached == 0) {
        digitalWrite(ch3a, HIGH);
      }
    
      if (starboard_cached == 0) {
        digitalWrite(ch4a, HIGH);
      }
    }
    
    if (!vertical_active && vertical_cached != 0)
    {
      digitalWrite(ch1a, vertical_cached  >= 0 ? LOW : HIGH);
      digitalWrite(ch2a, vertical_cached  >= 0 ? LOW : HIGH);
      vertical_active   = true;
    }
    if (!port_active && port_cached != 0) {
      digitalWrite(ch3a, port_cached >= 0 ? LOW : HIGH);
      port_active  = true;      
    }
    if (!starboard_active && starboard_cached != 0) {
      digitalWrite(ch4a, starboard_cached      >= 0 ? LOW : HIGH);
      starboard_active       = true;
    }
  }

  if (vertical_active && period >= abs(vertical_cached)) {
    vertical_active = false;
    digitalWrite(ch1a, vertical_cached  >= 0 ? HIGH : LOW);
    digitalWrite(ch2a, vertical_cached  >= 0 ? HIGH : LOW);
  }

  if (port_active && period >= abs(port_cached)) {
    port_active = false;
    digitalWrite(ch3a, port_cached >= 0 ? HIGH : LOW);
  }

  if (starboard_active && period >= abs(starboard_cached)) {
    starboard_active = false;
    digitalWrite(ch4a, starboard_cached >= 0 ? HIGH : LOW);
  }
}

void setOutput(String msg) {
  // expects a 4 digit string, values 0, 1 or 2

  noInterrupts();
  sscanf(msg.c_str(), "vertical=%i;starboard=%i;port=%i;lights=%i", &vertical, &starboard, &port, &lights);

  //Diving/rising motors
  updateBChannel = true;
  vertical  = constrain(vertical , -100, 100);
  port      = constrain(port     , -100, 100);
  starboard = constrain(starboard, -100, 100);

  interrupts();

  //LED lights
  if(lights){
    digitalWrite(ledPin, HIGH);
  }else{
    digitalWrite(ledPin, LOW);
  }
}
