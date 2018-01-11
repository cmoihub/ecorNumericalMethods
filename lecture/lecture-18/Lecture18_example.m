clc
%ECOR 2606 Lecture 18 examples
%example 1
clear;
clc;
x = [ 1 3 5 ];  
y = [ 4 2 8 ];

% Create Vandermonde matrix.
V=[(x.^2)' x' [1;1;1]]
condV=cond(V)
p1=V\y'
 
p = polyfit (x, y, 2) % 3 points, second order polynomial
 
fprintf ('The estimated value of y at x = 2.5 is %f\n', polyval (p, 2.5));
fprintf ('The estimated value of y at x = 3.6 is %f\n', polyval (p, 3.6));
fprintf ('The estimated value of y at x = 4.1 is %f\n', polyval (p, 4.1));
xp = linspace(1,5,100); yp = polyval (p, xp);
 
plot (x, y, 'xk', xp, yp, 'k--','MarkerSize', 15);
axis ([0 6 0 10]); grid on;
fprintf('Hit <CR> to continue\n')
pause


clear;
clc;
%example 2

years = 1920:10:1990;
pop = [ 106.46, 123.08, 132.12, 152.27, 180.67, 205.05, 227.23, 249.46];

p = polyfit (years, pop, 7);
% transform the data to remove the warning

firstYear = years(1); lastYear = years(length(years));
midRangeValue = (lastYear + firstYear) /2;
halfRange = (lastYear - firstYear) / 2;
transform = @(y)  (y - midRangeValue)  / halfRange;

yearsT = transform(years);

p = polyfit (yearsT, pop, 7);
pop1955 = polyval (p, transform(1955))
pop2000 = polyval (p, transform(2000))


year2 = 1900:2000;   % in steps of 1
pop2 = polyval (p, transform(year2));
figure (2);
plot (years, pop, 'o', year2, pop2, 'k', 'MarkerSize', 10);
xlabel('Year'); ylabel('Population (millions)');
grid on


% Example 3 Runge's Function

fprintf('Hit <CR> to continue\n');
pause;
clear
clc

runge = @(x) 1./(1+25*x.^2);
xplot=linspace(-1,1,100);
xdata=linspace(-1, 1, 9);
y5=runge(xdata(1:2:length(xdata)));
p4=polyfit(xdata(1:2:length(xdata)), y5, 4);
y9=runge(xdata);
p8=polyfit(xdata, y9,8);

figure(3)
plot(xplot, runge(xplot),'--', xplot, polyval(p4,xplot), 'b', xplot, polyval(p8,xplot),'r', xdata, y9,'bo','MarkerSize', 10)

