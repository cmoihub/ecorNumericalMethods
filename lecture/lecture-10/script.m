f_ = @(x) x^2 - 2*x - 5;
f = @(x) x^2 - 6 - 2*x;
golden(f_, 0, 3, 0.01, 1)