clear
clc
f = @(x) 50 * sin(0.5 * x) - x.^2 + 17 * x - 60;  % from last problem

fplot(f,[0 20])
brackets = incsearch ( f, 0, 20, 100 );
brackets
 
[n m] = size(brackets) % note vector on left hand side
 
if n == 0 
    fprintf ('No roots found.\n');
else
    for k = 1 : n
        x(k) = fzero(f, brackets(k, :));  % select whole row
        fprintf ('There is a root at x = %f\n', x(k));
    end
end


root = bisect( f, brackets(1,1), brackets(1,2), 0.001, 1)
