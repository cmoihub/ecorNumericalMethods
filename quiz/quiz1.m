A = 5;
B = 3;

warning('off', 'MATLAB:fplot:NotVectorized')

% Opposite side
height = @(angle, hypotenuse) sind(angle) .* hypotenuse;
% Adjacent side
width = @(angle, hypotenuse) cosd(angle) .* hypotenuse;

a_y = @(t) height(2.*t, A);
a_x = @(t) width(2.*t, A);
b_y = @(t) height(2.*t, B);
b_x = @(t) 8 - width(2.*t, B);
f = @(t) norm([a_x(t) a_y(t)] - [b_x(t) b_y(t)]);
 
figure(1)
fplot(f, [0 45]);
title = ('Distance versus time');
xlabel = ('Time in seconds');
ylabel = ('Distance between door ends in metres');
grid on


% 
figure(2)
grid on
title = ('Distance versus time');
xlabel = ('Time in seconds');
ylabel = ('Distance between door ends in metres');
n = 100;
x = linspace(0,45,n);
y = zeros([1 n]);
for k = 1:n
    y(k) = f(x(k));
end
plot(x,y)
% f = 5
% f - 5 = 0

time_when_5m_apart = fzero(@(t) f(t) - 5, [32 33]);
fprintf('%f\n', time_when_5m_apart)

fprintf('Distance\t\t Time\n')
d = 0:1:45;
for k = 1:length(d)
    fprintf('%.1f\t\t\t%.2f\n',d(k),f(d(k)));
end
