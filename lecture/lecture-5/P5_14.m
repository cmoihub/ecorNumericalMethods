function [ i ] = P5_14( P, A, n )
%P5_14 Calculate interest rate.
% NOTE: Assumes that interest rate is >= 0.005.
% Inputs:  P = present value of item
%          A = annual payment
%          n - number of years
% Outputs: i = interest rate (as a fraction)
 
f = @(i) (P * (i .* (i + 1).^n) ./ ((i + 1).^n - 1)) - A;
 
maxI = A/P; % when i is very large, equation becomes A=Pi, hence i=A/P
 
i = fzero(f, [ 0.005 maxI ] ); 
 
end
