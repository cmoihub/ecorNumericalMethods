% Lab 20 by Craig Isesele (100950074)

function [] = q1()
clc;
clear;

% Question 1:
Temp = (300:5:320);
Cp = [4.1354;10.0120;6.5956;3.5266;2.6559];

figure(1);
plot(Temp, Cp, 'ro');
title('Temp vs. Cp');
ylabel('Cp');
xlabel('Temp');
hold on;
grid on;

% Interpolating polynomial to estimate the temp
first = Temp(1);
last = Temp(end);
mid = (last + first) / 2;
half = (last - first) / 2;

t = @(x) (x - mid) / half;
ft = t(Temp);

p2 = polyfit(ft, Cp, 4);
f1 = @(x) polyval(p2, t(x));

% Plot
fplot(f1, [300 320], 'k');

fprintf('Question 1:\n');
fprintf('Using interpolating polynomial, at Temp = 303,  Cp = %f\n', f1(303));
fprintf('Using interpolating polynomial, at Temp = 312,  Cp = %f\n\n', f1(312));

% Regular cubic spline
s = spline(Temp, Cp);
cubicSpline = @(x) ppval(s, x);

% Second plot
fplot(cubicSpline, [300 320], 'b');

% Extrapolating
fprintf('Using cubic spline, at Temp = 303,  Cp = %f\n', cubicSpline(303));
fprintf('Using cubic spline, at Temp = 312,  Cp = %f\n\n', cubicSpline(312));

% Hermite interpolation
% Piecewise cubic
pp = pchip(Temp, Cp);
hermite = @(x) ppval(pp, x);

% Third plot
fplot(hermite, [300 320],'r');
fprintf('Using piecewise cubic Hermite, at Temp = 303,  Cp = %f\n', hermite(303));
fprintf('Using piecewise cubic Hermite, at Temp = 312,  Cp = %f\n\n', hermite(312));

% Need root finding for Cp=6
% Find at first x val 
x6 = fzero(@(x) f1(x)-6, [300 302]);
fprintf('Using interpolating polynomial, Cp = 6 at Temp = %f,\n\n', x6);

% Question 2:
% Defined a load distribution function below
fprintf('Question 2:\n');
fprintf('I1(0.6) for a ball bearing = %f\n\n', loadDistribution(0.6, 1.5, 1));

% Question 3:
t = [1 2 3.25 4.5 6 7 8 8.5 9.3 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];

fprintf('Question 3:\n');
fprintf('b) The distance travelled using Trapezoidal Rule is %f m\n', trapz(t, v));

simpsonPoly = polyfit(t, v, 3);
simpsonF = @(x) polyval(simpsonPoly, x);
% 10-5.5 = 4.5 based on formula
simpsonVal = (4.5/3) * (simpsonF(1) + 4*simpsonF(5.5) + simpsonF(10));
fprintf('c) The distance travelled using Simpsons 1/3 rule is %f m\n', simpsonVal);

distance = integral(simpsonF, 1, 10);
fprintf('d) The distance travelled using the normal technique is %fm\n', distance);
fprintf('\nDiscussion:\nTrapezoidal uses a linear approximation.\n');
fprintf('The answers are identical for Simpsons and the normal technique because the cubic function fits perfectly.\n');
end

function [i] = loadDistribution(e, c, m)
% DIST function used for question 2
integ = @(x) (1 - ( 1 - cos(x)) / (2 * e));
value = integ(0) - integ(c);
loadDisF = @(x) value * cos(m * x);
a = acos(1 - 2 * e);
cst = 1 / (2 * pi);
i = cst * integral(loadDisF, -a, a);
end