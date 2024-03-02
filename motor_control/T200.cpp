#include "T200.h"

T200::T200(byte pin): controllerPin(pin) {
  attach(controllerPin);
  writeMicroseconds(1500); // send stop signal to ESC

  delay(7000); // delay to allow the ESC to recognize the stop signal
}

// Thrust is in kilogram-force at the moment
void T200::setThrust(double thrust) {
  thrust = constrain(thrust, -3.795, 4.885);
  uint16_t output;

  if (thrust < 0) output = map(thrust, -3.795, 0, 1100, 1500);
  else output = map(thrust, 0, 4.885, 1500, 1900);

  writeMicroseconds(output);
}