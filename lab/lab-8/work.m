% Lab 8 by Craig Isesele on R2017b

function [] = work()
    clc;
    clear;
    
    load data.txt;
    x = data(:, 1);
    y = data(:, 2);
    
    p = polyfit(x, y, 3);
    fprintf('Polynomial is y = %f*x^3 %f*x^2 + %f*x + %f\n',p);
    
    g = @(x) polyval(p, x);
    
    r = fzero(@(x) g(x)-0.065, [6 12]);
    fprintf('x value = %f at y = 0.065 from 6 to 12.\n', r);
    

    %Plot function
    figure(1);
    fplot(g);
    %Hold on needed
    hold on;
    plot(x,y,'rx');
    hold off;
    title(' x vs. y ');
    ylabel('y');
    xlabel('x');
    grid on;
    
    T = [0 5 10 20 30 40];
    Ta = T + 273.15; % convert to Kelvin
    u = [1.787 1.519 1.307 1.002 0.7975 0.6529];
    [D, B] = fitExp(u, Ta);
    
    f = @(x) D*exp(B./x);
    
    fprintf('\nAndrades Equation:\nD=%f\nB=%f',D,B);
    fprintf('\nCorrelation Coefficient= %f\n', correlate(Ta, u, f));
    
    %Plot Andrades Equations on single graph
    figure(2);
    fplot(f, [min(Ta) max(Ta)]);
    hold on;
    plot(Ta,u,'rx');
    hold off;
    title('Andrades Equation');
    xlabel('x');
    ylabel('y');
    grid on;
    
    function[D, B] = fitExp(u, Ta)
%   FITEXP find best fit for function 
%   Input   u - dynamic viscosity
%           Ta - absolute temperature in K
%   Output  D & B are unknown parameters
        u = log(u); % transform the u values
        p = polyfit(1./Ta, u, 1); % fit a straight line to the transformed data
        D = exp (p(2));
        B = p(1);
    end
    
    function [r] = correlate( x, y, f )
    %CORRELATE calculates the correlation coefficient for given data and function

    yBar = mean(y);

    St = 0; Sr = 0;
    for i = 1:length(x)
        St = St + (y(i) - yBar) ^ 2;
        Sr = Sr + (y(i) - f(x(i))) ^2;
    end

    r2 = (St - Sr) / St;
    r2 = max([r2 0]); % avoid silly numbers when fit worse than average
    r = sqrt(r2);

    end

    
end