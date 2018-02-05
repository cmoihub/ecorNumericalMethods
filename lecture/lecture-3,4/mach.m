figure (1);
fplot (@PR, [0, 7]);
xlabel ('Mach Number');
ylabel ('Pressure Ratio');
grid on;

ratio = input ('Enter pressure ratio: ');

% define function for root finding
f = @(M) PR(M) - ratio;

M = fzero (f, [0 7]);

fprintf ('The mach number is %4.4f\n', M);

%{
M = linspace (0, 7, 50);
ratio = PR(M);
plot (M, ratio);
grid on
%}
