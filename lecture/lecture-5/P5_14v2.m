function [ i ] = P5_14v2( P, A, n )
%P5_14v2 Calculates interest rate.
%  Inputs and outputs as before…

f = @(i) calcA (P, n, i) - A;
maxI = A/P;
 i = fzero(f, [ 0 maxI ] );
 
 end
 
function [A] = calcA (P, n, i)
 if i == 0
    A = P / n;
else
    A =  P * (i .* (i + 1).^n) ./ ((i + 1).^n - 1);
end

end
