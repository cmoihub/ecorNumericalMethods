% Craig Isesele
% 100950074
% ECOR 2606 LAB 4

function [xr] = falsePos(f, xl, xh, Edes, display)
% FALSEPOS Finds a root by performing a false position search.
% Inputs: f = a function of one variable
%         xl = lower bound of range to be searched
%         xh = upper bound of range to be searched
%         **** f(a) and f(b) must have different signs ****
%         Edes = tolerance in x (function stops when xr is guaranteed to
%                                be within Edes of a root)
%         display = display option (0 = no output, 1 = output, defaults to 0)
% Outputs: xr = estimate of root
 
if nargin < 5; display = 0; end
 
yl = f(xl);  yh = f(xh);
if sign(yl) == sign(yh), error ('no sign change'), end
 
if display
  fprintf ('  step        xl           xh           xr           yr           Emax\n');
end
 
signOfYl = sign(yl);  % keep track of sign of function at xl
for k = 1:1000         % 1000 max iterations
    xr = xh - f(xh)*(xl-xh)/(f(xl)-f(xh));
    yr = f(xr);  Emax = abs(xl-(xh + xl) / 2);
   
    if display
        fprintf ('%5d   %12.6f %12.6f %12.6f %12.6f %12.6f\n', k, xl, xh, xr, yr, Emax);
    end
    
    if Emax <= Edes || yr == 0  % error acceptably small or direct hit
        return;
    end
    
    if sign(yr) == signOfYl
        xl = xr;
    else
        xh = xr;
    end
   
end
 
error ('Bisection search has not converged');   % most unlikely
 
end
