function [d] = quiz1_door(A, B, t)

% DISTANCE_BETWEEN_DOORS calculates distance between 2 doors
% INPUT
% A - width of door 1 in metres
% B - width of door 2 in metres
% t - time in seconds
% OUTPUT
% distance - distance between 2 doors


% Adjacent side
width = @(angle, hypotenuse) cosd(angle).*hypotenuse;
% Opposite side
height = @(angle, hypotenuse) sind(angle).*hypotenuse;

a_x = width(2.*t, A);
a_y = height(2.*t, A);
b_x = 8 - width(2.*t, B);
b_y = height(2.*t, B);

d = sqrt((a_x-b_x)^2 + (a_y-b_y)^2);
return
end