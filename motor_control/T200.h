#ifndef T200_H
#define T200_H

#include <Arduino.h>
#include <Servo.h>

class T200: public Servo {
  private:
    const byte controllerPin;
  
  public:
    T200(byte pin);

    void setThrust(double thrust);
};

#endif