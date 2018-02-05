% Craig Isesele
% 100950074
% ECOR 2606 LAB 4
function [ cube ] = cubeRoot(positive_value)
%   CUBEROOT finds the cube root of a positive using Newton-Raphson Search
%   Inputs: positive_value
%   Outputs: cube = the cube root of given number

for k=1:1000
    if k==1
        xold = positive_value;
    end
    
    xnew = xold - ((xold^(3)-positive_value)/(3 * xold^2));
    cube = xnew;
    Ea = abs(xold-cube);
    
    if Ea <= 10^(-6) %kicks out when reduced
        return;
    end
    
    xold = xnew;
end
error ('Newton search has not converged');
end