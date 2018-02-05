% Craig Isesele
% 100950074
% ECOR 2606 LAB 4

g = @(c) 2.*c/(4+0.8.*c+c.^2+0.2.*c.^3);
% [0.2 1 0.8 4];
% (4+0.8.*c+c.^2+0.2.*c.^3)
figure(1)
fplot(g, [0,10]);
xlabel("food concentration")
ylabel("specific growth rate")
title("g/c")
grid on

h = @(x) g(x) - 0.2; 
% 0, 1
% 4, 5
false1 = falsePos(h, 0, 1, 0.001, 1);
false2 = falsePos(h, 4, 5, 0.001, 1);

true1 = fzero(h, [0 1]);
true2 = fzero(h, [4 5]);

fprintf('The two solutions found using false position search were: %f and %f \n', false1,false2);
fprintf('The two solutions found using fzero search were: %f and %f \n', true1,true2);

i = @(x)-g(x);
[a, b] = fminbnd(i, 1, 2);
fprintf('maximum food concentration = %f, maximum growth rate = %f\n', a, -b);