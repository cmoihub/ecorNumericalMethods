function [ x ] = Babylon( N )
%BABYLON Uses Babylonian technique to find the square root of a value.
% Inputs: N = value of interest
% Outputs: x = square root of N
 
xold = N;
for k = 1 : 20
    x = 0.5*(xold + N/xold);
    change = abs(x - xold);
    fprintf ('x(%d) = %f, absolute change = %f\n', k, x, change );
    if change < 1e-6
        fprintf ('Babylonian technique has converged.\n');
        return; 
    end
    xold = x; %get ready for next iterations
end;
 
error ('Babylonian technique has not converged.');
    
end
