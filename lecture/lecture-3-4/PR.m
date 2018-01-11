function [ ratio ] = PR( M )
%PR  Given a Mach number, returns the corresponding pressure ratio
%  Inputs:  M = Mach number
%  Outputs: ratio = pressure ratio (stagnation pressure / static pressure)

if M <= 1
    ratio = (1 + 0.2 * M^2)^3.5;
else
    ratio = (1.2 * M^2)^3.5 * ((7/6)* M^2 - 1/6)^-2.5;
end

end

