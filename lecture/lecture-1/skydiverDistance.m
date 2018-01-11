%ECOR 2606 Lecture 1 skydiverDistance.m
% K.R. Goheen 1/1/2016
clc
clear

T = 10; % time of interest

m = 69.1; g = 9.81; cD = 0.25;

% analytical solution
distanceA = (m / cD) * log(cosh(sqrt((g * cD)/m) * T));
fprintf ('Analytical = %f\n', distanceA);

% numerical solution
fprintf ('Intervals    Numerical\n');
for n = 2: 10: 142; % n = number of points
  t = linspace (0, T, n);
  v = sqrt(g * m / cD) * tanh(sqrt(g * cD / m) * t);
  distanceN = trapz(t, v);
  fprintf ('%5d        %10.6f\n', n - 1, distanceN);
end

