%% Example Calc
forceVect = [-1, -2];
fprintf("Cartensian Movement")
[Fh1,Fh2,Fh3,Fh4] = thrusterAllocation(forceVect)

newHeading = 180; %in degrees
fprintf("Heading Reorient")
[Fh1,Fh2,Fh3,Fh4] = momentCalc(newHeading)


%% Cartesian Movement
%For finding the horizontal thrust vectors.
function [Fh1,Fh2,Fh3,Fh4] = thrusterAllocation(forceVect)
    Fx = forceVect(1);
    Fy = forceVect(2);

    Values = rref([ ...
        cosd(45),cosd(135),Fx; ...
        sind(45),sind(135),Fy ...
        ]);

    forces = Values(1:2,3);
    scale = max(abs(forces));

    [Fh2, Fh4] = deal(forces(1)/(scale));
    [Fh1, Fh3] = deal(forces(2)/(scale));
end

%% Heading Reorient
function [Fh1,Fh2,Fh3,Fh4] = momentCalc(newHeading)
    if newHeading > 180
        [Fh1,Fh4] = deal(1);
        [Fh2,Fh3] = deal(-1);
    else
        [Fh1,Fh4] = deal(-1);
        [Fh2,Fh3] = deal(1);
    end
end

%% Vertical Thruster
