function [ xr ] = secant (f, x0, x1, Edes, kmax, display)
% SECANT  Finds a root by performing a secant search.
% Inputs: f - a function of one variable
%         x0 - first of two starting values
%         x1 - second of two starting values
%         Edes = tolerance in x (function stops when approximate
%                                error becomes less than Edes)
%         kmax - maximum number of iterations
%         display  = 1 if display results
% Outputs: xr - estimate of root

if nargin < 6; display = 0; end
if nargin < 5; kmax = 200; end

xim1 = x0; yold = f(xim1);
xi = x1; ymid = f(xi);

if display
    fprintf ('  Step   x(i-1)      x(i)      x(i+1)     y(i+1)      Eapp\n');
end

for k = 1: kmax
    
    xr = xi - ((xi - xim1) / (ymid - yold)) * ymid;
    ynew = f(xr); Eapp = abs(xi - xr);
   
    if display
        fprintf ('%5.0f %10.6f %10.6f %10.6f %10.6f %10.6f\n', k, xim1, xi, xr, ynew, Eapp);
    end
    if Eapp <= Edes || ynew == 0 
        if display
            fprintf ('Secant search has converged.\n'); 
        end
        return;
    end
    
    if k == kmax 
        error ('Secant search has not convered.');
    end
    
    xim1 = xi; yold = ymid;
    xi = xr; ymid = ynew;
    
end

end

