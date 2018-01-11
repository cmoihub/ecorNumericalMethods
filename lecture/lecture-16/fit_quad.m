load data2.txt
x=data2(:,1);
y=data2(:,2);
p = polyfit (x, y, 2);   % 2 for second order
xplot = linspace (-1, 22, 100);  
yplot = polyval (p, xplot);
plot (x, y, 'o', xplot, yplot, 'MarkerSize', 10);
fprintf ('The best fit curve is %6.4f * x^2 + %6.4f * x + %6.4f\n',...
                   p(1), p(2), p(3));


f = @(x) p(1) * x .^ 2 + p(2) * x + p(3);
r = correlate (x, y, f);
fprintf ('The correlation coefficient is %6.4f\n', r);

