clear
clc
M = 0 : 0.1 : 7;  % from 0 to 7 in steps of 0.1
ratio=zeros(length(M));

for k = 1 : length(M) % from 1 to length(M) in steps of 1
    ratio(k) = PR(M(k));
end
%ratio=PRv(M);

figure (1)
plot (M, ratio);
xlabel ('Mach Number');
ylabel ('Pressure Ratio');
grid on;
