warning('off', 'MATLAB:fplot:NotVectorized')

A = 5;
B = 3;
t1 = 0;
t2 = 45;

f = @(t) quiz1_door(A, B, t);

figure(1)
grid on
xlabel('Time');
ylabel('Distance')
title('Distance over time')
fplot(f, [t1 t2]);

figure(2)
grid on
xlabel('Time');
ylabel('Distance')
title('Distance over time')
n = 100;
x = linspace(t1,t2,n);
y = zeros([1 n]);
for k = 1:n
    y(k) = f(x(k));
end
plot(x,y)

% f - 5 = 0
% Range is between 32,33
root = fzero(@(t) f(t) - 5, [32 33]);
fprintf('When doors are 5m apart, time is %f second(s)\n', root)