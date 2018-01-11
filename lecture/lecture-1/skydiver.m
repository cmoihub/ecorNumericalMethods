%ECOR 2606 Lecture 1 skydiver.m
% K.R. Goheen 1/1/2016
clear
clc

tMax = 20; % maximum time

m = 69.1; g = 9.81; cD = 0.25;

% DIY Euler solution
n = 21; % number of points (including initial point)
deltaT = tMax / (n - 1); % interval width
t = linspace (0, tMax, n);
v = zeros (size(t));
for i = 2:n
    v(i) = v(i - 1) + (g - ((cD / m) * v(i - 1)^2)) * deltaT;
end

% analytical solution
tFine = linspace (0, tMax, 100);
vCalc = sqrt(g * m / cD) * tanh(sqrt(g * cD / m) * tFine);

figure (1)
plot (t, v, 'r-o', tFine, vCalc, 'k');
title ('Skydiver Velocity vs Time');
xlabel ('Time (seconds)');
ylabel ('Velocity (m/s)');
grid on; 

% ODE Solver solution
% use Anonymous function
dvdt = @(t,v) g - ((cD / m) * v^2);
[tt vv] = ode23(dvdt, linspace (0, tMax, 100), 0);

figure (2)
plot (tt, vv, 'r', tFine, vCalc, 'k');
title ('Skydiver Velocity vs Time');
xlabel ('Time (seconds)');
ylabel ('Velocity (m/s)');
grid on
