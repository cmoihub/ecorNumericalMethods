function [rmax] = maxroot(p)
% Maxroot outputs the absolute value of the root of p with the greatest
% absolute value
% Inputs: p = row vector represents the coefficients of a polynomial
% Outputs: rmax = absolute value of the root of p with the greatest
% absolute value

if length(p) <= 1
    error('the length of row vector p must be greater than 1')
end

roots_p = roots(p);
abs_roots = zeros(length(roots_p));
for k = 1:length(roots_p)
    abs_roots(k) = abs(roots_p(k));
end
rmax = abs_roots(isreal(max(abs_roots)));

end