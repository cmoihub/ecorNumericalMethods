temp = [300:5:320];
cp = [4.1354 10.0120 6.5956 3.5266 2.6559];
firstTemp = temp(1);
lastTemp = temp(end);
range = [firstTemp lastTemp]

figure(2)
grid on;
hold on;
xlabel('Temperature');
ylabel('Specific Heat');
title('The temperature (in K) and constant pressure specific heat')
plot(temp, cp, 'k--');

p = polyfit(scale(temp), cp, 4);
v = @(x) polyval(p, scale(x, temp));
fplot(v, [firstTemp lastTemp], 'bo');
printer(303, v, 'interpolating polynomial');
printer(312, v, 'interpolating polynomial\n');
fprintf('End of Part 1i\n')

cubicSpline = @(x) interp1(temp, cp, x, 'spline');
printer(303, cubicSpline, 'regular cubic spline');
printer(312, cubicSpline, 'regular cubic spline\n');
fplot(cubicSpline, range, 'ro')
fprintf('End of Part 1ii\n')

hermite = @(x) interp1(temp, cp, x, 'pchip');
printer(303, hermite, 'piecewise cubic');
printer(312, hermite, 'piecewise cubic\n');
fplot(hermite, range, 'go')
fprintf('End of Part 1iii\n')

root = fzero (@(cp) v(cp) - 6, [306 320]);
fprintf('T is %f when Cp is 6\n\n', root);

e = 0.6;
[m, c] = randomize();
Im(e, acos(1-2*e), c, m)
fprintf('End of Part 2\n')

t = [1 2 3.25 4.5 6 7 8 8.5 9.3 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
fprintf('Distance travelled is %f\n', trapz(t,v))
fprintf('End of Part 3b\n')

p = polyfit(t, v, 3);
val = @(t) polyval(p, t);
h = (max(t) - min(t))/2;
cubic = h*(val(1) + 4*val(5.5   ) + val(10))/3;
fprintf('Distance travelled is %f\n', cubic)
fprintf('End of Part 3c\n')
fprintf('Distance travelled is %f\n', integral(val, 1, 10))
fprintf('End of Part 3c\n')
hold off;

function [value] = scale(x, array)
if exist ('array', 'var') == 0
    array = x;
end
first = array(1);
last = array(end);
mid = (last + first)/2;
half = (last - first)/2;
value = (x - mid)/half;
end

function [m, c] = randomize()
n = rand;
if n>0.5
    c = 1.5;
else 
    c = 1.1;
end
n = rand;
if n>0.5
    m = 1;
else 
    m = 0;
end
end

function [] = Im(e, a, c, m)
fprintf('For e = %f, a = %f, c = %f, m = %f\n', e, a, c, m);
b = @(x) 1-(1-cos(x))/(2*e);
range = b(c) - b(0);
f = @(x) range*cos(m*x);
value = integral(f, a, -a)/(2*pi);
fprintf('Load distribution is %f\n', value);
end

function [] = printer(x, f, fname)
% PRINTER helper function to describe specific heat given some temperature
% and the function used to calculate the specific heat
% x - temperature
% f - function
% fname - function description
fprintf('Cp at t =%d is %f\n', x, f(x));
fprintf('Method used:');
fprintf(fname);
fprintf('\n');
end