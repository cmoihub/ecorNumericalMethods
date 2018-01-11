a = 1;
b = 4;
c = -20;

disc = b^2 - 4 * a * c;
x1 = (-b + sqrt(disc)) / (2 * a)
x2 = (-b - sqrt(disc)) / (2 * a)

x = roots([a b c])

p = [a b c];
x = roots(p);
x(1)
x(2)

f = @(x) a*x^2 + b*x + c;
x = fzero(f, [0 4])
x = fzero(f, 4)
x = fzero(f, -4)

figure(1);
width = linspace(0, 10, 50);
area = width .* (width + 4);
plot (width, area);
xlabel ('Room width (metres)');
ylabel ('Room area (square metres)');
grid on;

f = @(x) a*x.^2 + b*x + c; % redefine using dot version of exponentiation

figure(2);
x = linspace(-10, 10, 50);
y = f(x);
plot (x, y);
xlabel ('x (metres)');
ylabel ('f(x) (square metres)');
grid on;
