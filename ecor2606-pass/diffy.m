function [diff] = diffy(f, xl, xu)
% DIFFY
% Inputs
% Outputs

if xu < (xl+2)
    error('xu is not 2 greater than xl')
end

figure(1)
title('Plot of f')
xlabel('x')
xlabel('y')
grid on
fplot(f, [xl, xu])

xmin = fminbnd(f, xl, xu);
f_ = @(x) -f(x);
xmax = fminbnd(f_, xl, xu);
ymin = f(xmin);
ymax = f(xmax);

diff = ymax - ymin;

end

