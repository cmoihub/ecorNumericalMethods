% Runge function
clear
clc
runge = @(x) 1 ./ (1 + 25 * (x .^ 2));

x = linspace (-1, 1, 100);
y = runge(x);

xpts = -1: 0.5: 1;
ypts = runge(xpts);

p=polyfit(xpts,ypts,4);
yp=polyval(p,x);

ys = interp1 (xpts, ypts, x, 'pchip'); % replace spline with pchip

figure (3)
plot (xpts, ypts, 'bo', x, y, 'r--', x, ys, 'b',x,yp,'k-.', 'MarkerSize', 10)
grid on
pause

yptsX = [0.5 ypts -5]; % try differemt end slopes
ys = spline (xpts, yptsX, x);
hold on;
plot (x, ys, 'g');
hold off;

