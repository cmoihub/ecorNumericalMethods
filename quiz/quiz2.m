figure(1)
ylabel('H')
xlabel('f')
title('H vs f')
fplot(func, [0.1 0.975]);

figure(2)
ylabel('H')
xlabel('f')
title('H vs f')
f = linspace(0.1, 0.975, 100);
H = zeros(size(f));
for k = 1:length(f)
    H(k) = func(f(k));
end
plot(f, H);

fprintf('Response (V/V) Freq (Hz)\n');
matrix = 0.1:0.025:0.975;
for k = 0.1:0.025:0.975
    fprintf('%f      %f\n', k, func(k));
end