function [r] = correlate( x, y, f )
%CORRELATE calculates the correlation coefficient for given data and function
 
yBar = mean(y);
 
St = 0; Sr = 0;
for i = 1:length(x)
    St = St + (y(i) - yBar) ^ 2;
    Sr = Sr + (y(i) - f(x(i))) ^2;
end;
 
r2 = (St - Sr) / St;
r2 = max([r2 0]); % avoid silly numbers when fit worse than average
r = sqrt(r2);
 
end
