% Set PID constants

kP = a; %found via tuning (Simulation, practical testing)
kD = b; % found via tuning (Simulation, practical testing)
kI = c;% found via tuning (Simulation, practical testing)


% Define error (must be continuoisly looped as sensor data changes)

setPoint = d; % Desired value (for rotation, could be a final change in
              % degrees of rotation from starting point)
measuredPoint = e; % Current value, must be fed back into code via sensors

error = setPoint - measuredPoint; %Difference between desired value and 
                                  %current value


% Define P, I, and D control terms

Pterm = kP * error; %Error term proportional to current value of error

errorPrevious = f; %error term from previous iteration through loop
loopPeriod = g; %time period between loop iterations

Dterm = kd*((error-errorPrevious)/loopPeriod); %Error term proportional to 
                                               % derivative of error


Iterm = Iterm + kI*error; %Error term proportional to error that does not 
                          %change over time. Changes in value as error
                          %loop iterates.Can be used if P and D 
                          %alone cannot get sufficently close to setpoint


PIDtotal = Pterm + Dterm + Iterm;


