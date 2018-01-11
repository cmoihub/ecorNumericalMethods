x = [0 5 10 15 20];
y = [100 200 450 950 2000];
 
yt = log(y);  % transform the y values
 
p = polyfit (x, yt, 1);  % fit a straight line to the transformed data
 
fitt = @(x) p(1) * x + p(2);  % function for the fitted line
figure (1)
plot (x, yt, 'x', x, fitt(x), 'MarkerSize', 10);
grid on; xlabel ('Years'); ylabel ('ln(Population)');
 
fprintf ('For transformed data a = %f, b = %f, r = %f\n', ...
             p(1), p(2), correlate (x, yt, fitt));
         
         pause
         
% calculate alpha and beta
alpha = exp(p(2));  
beta = p(1);

fit = @(x) alpha * exp(beta * x); % function for fitted curve
 
% need lots of x values to get a smooth plot of the fitted curve
xplot = linspace (0, 25, 100);  % plot up to 25 years
yplot = fit(xplot);
 
figure (2)
plot (x, y, 'x', xplot, yplot, 'MarkerSize', 10);
grid on;
xlabel ('Years');
ylabel ('Population');
 
fprintf ('For original data alpha = %f, beta = %f, r = %f\n',alpha, beta, correlate (x, y, fit));

fprintf('Predicted poplation after 25 years = %f\n', fit(25));
