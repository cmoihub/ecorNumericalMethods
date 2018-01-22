function x = golden (f, xL, xU, Edes, display)
% GOLDEN  Finds a minimum by performing a golden section search.
% Inputs: f - a function of one variable
%         xL - lower bound of region containing minimum
%         xU - upper bound of region containing minimum
%         Edes - function stops when x within Edes of minium
%           display - diplays intermediate results when set to 1
% Outputs: x - estimate of minimum
 
if nargin < 5; display = 0; end
 
p1 = ((1 + sqrt(5)) / 2) - 1;  % golden ratio - 1
 
if display
  fprintf ...
  ('    k      xL           x2           x1           xU           f(xL)            f(x2)        f(x1)       f(xU)      Emax\n');
end
 
% set up for first iteration
x1 = xL + p1 * (xU - xL); fx1 = f(x1);
x2 = xU - p1 * (xU - xL); fx2 = f(x2);
fprintf('d = %f', p1*(xU-xL));
for k = 1 : 1000
 
    Emax = (xU - xL) / 2;
    if display
      fprintf ('%5d %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f\n', k, xL, x2, x1, xU, f(xL), f(x2), f(x1), f(xU), Emax);
    end 
    if (Emax <= Edes)
        x = (xL + xU) / 2; return;
    end
       
    if fx2 < fx1
        xU = x1; x1 = x2; fx1 = fx2; % old x2 becomes new x1
        x2 = xU - p1 * (xU - xL); fx2 = f(x2); % brand new x2 required
    else
        xL = x2; x2 = x1; fx2 = fx1; % old x1 becomes new x2
        x1 = xL + p1 * (xU - xL); fx1 = f(x1); % brand new x2 required
    end
   
end
 
error ('Golden section search has not converged.');
 
end
