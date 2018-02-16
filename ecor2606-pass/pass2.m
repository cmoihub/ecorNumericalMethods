v1 = linspace(1, 100, 10);
v2 = linspace(1, 10, 10);

y = @(x) 5*x.^3 + 2*x - 1;

fprintf('The second value in the vector resulting from the evaluation of y at vector v1 is %.1f\n', y(v1))
fprintf('The second value in the vector resulting from the evaluation of y at vector v2 is %.1f\n', y(v2))

b = @(x) x.^2 + 3*x.^2 - 4;
c = @(x) -10*x.^2 - x + 2;
d = @(x) b(x) - c(x);

figure (1);
fplot(d, [0 1000]);

fprintf('b and c intersect at %f\n', fzero(d, [0 100]));