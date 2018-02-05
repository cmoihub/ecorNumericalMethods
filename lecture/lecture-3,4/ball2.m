% interactive version of ball script file
clear
clc

rho = input ('Enter specific gravity: ');
D = input ('Enter diameter of ball in mm: ');
r = D / 2;

f = @(x) x.^3 - 3 * r * x.^2 + 4 * r^3 * rho;

depth = fzero(f, [0 D]);

fprintf ('The ball will float %5.3f mm deep.\n', depth);
