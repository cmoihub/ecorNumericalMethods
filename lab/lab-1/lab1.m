% Lab 1
% Name: Craig Isesele
% Student No: 100950074

% Part 1
%a
B_t_1 = 250/(1 + 56.75*exp(-0.17*1));
%b
B_t_4 = 250/(1 + 56.75*exp(-0.17*4));
%c
B = @(t)250/(1 + 56.75*exp(-0.17*t));
%d
fprintf('Number of bacteria at t = 1 hour is %f\n', B(1));
%e
fprintf('Number of bacteria at t = 4 hours is %f\n', B(4));
%f
B_vector = @(t)250./(1 + 56.75*exp(-0.17*t));
fprintf('Number of bacteria at t = 1 or 4 hours is %f\n', B_vector([1 4]));
%g
figure(1)
fplot(B, [0 40])
%h

%i

%j

% Part 2


% Part 3