% Lab 2
% Name: Craig Isesele
% Student No: 100950074


R1 = 100;
R2 = 50;
g = @(D) overlap(R1,R2,D); % a function of one variable to use for fplot % or, if you prefer:
% f = @(D) overlap(100,50,D); % a function of one variable to use for fplot

figure(1)
fplot(g,[50 160]);
grid on;
title('Distance vs. Overlap');
xlabel('Distance (mm)');
ylabel('Overlap (mm)');

figure(2);
n = 100;
x = linspace(50,160,n);
y = zeros([1 n]);
for k = 1:n
   y(k) = g(x(k));
end
title('Distance vs. Overlap');
plot(x,y);
grid on;
xlabel('Distance (mm)');
ylabel('Overlap (mm)');

%Root finding problem:
% 2000 = @(D)overlap(R1, R2, D);
% 0 = @(D) g(D) - 2000;
root = @(D) g(D) - 2000;
rootFound = fzero(root, [110, 120]);
fprintf('Area: 2000mm squared, D: %.3f\n', rootFound)

%Part 2-C:
% D = 50mm to 160mm increments of 10mm
fprintf('Distance\t\t Overlap\n')
d = 50:10:160;
for k = 1:length(d)
    fprintf('%.1f\t\t\t%.2f\n',d(k),g(d(k)));
end
