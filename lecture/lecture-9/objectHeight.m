function [ height ] = objectHeight( v0, r, t )
% OBJECTHEIGHT Calculates height of an object shot vertically.
% Inputs: v0 = initial velocity (in m/s)
%         r = drag coefficient (in 1/s)
%         t = time (in s)
% Outputs: height = height of object (m)
 
if r == 0
    error ('zero drag coefficients are not allowed');
end

g = 9.81; % gravity
 
height = (1 / r) * (v0 + g/r) * (1 - exp(-r * t)) - g * t / r;
 
end
