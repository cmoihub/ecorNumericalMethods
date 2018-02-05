%ECOR 2606 Lecture 3 ball.m
clear
clc
D = 50;
r = D/2;
rho = 0.25;

p = [ 1 (-3 * r) 0 (4 * r ^3 * rho)];

x = roots(p)

f = @(x) x.^3 - 3 * r * x.^2 + 4 * r^3 * rho;

depth = fzero(f, [0 D])

figure (1)
fplot (f, [-D (2 * D)]);
grid on;

figure (2)
x = linspace (-D, 2 * D, 50);
y = polyval (p, x);
plot (x, y);
grid on;




