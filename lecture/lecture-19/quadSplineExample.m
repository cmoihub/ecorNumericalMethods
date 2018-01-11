clear
clc

xd = [ 3.0 4.5 7.0 9.0 ];
yd = [ 2.0 1.0 2.5 0.5 ];

a = yd(1:3);

A = [ 1.5 0 0 2.25 0 0 
      0 2.5 0 0 6.25 0
      0 0 2 0 0 4
      1 -1 0 3 0 0
      0 1 -1 0 5 0
      0 0 0 1 0 0 ];
B = [ -1; 1.5; -2; 0; 0; 0; ];

sol = A \ B;

b = sol(1:3)';
c = sol(4:6)';

[a ; b ; c]'

s1 = @(x) a(1) + b(1) * (x - xd(1)) +  c(1) * (x - xd(1)).^2;
s2 = @(x) a(2) + b(2) * (x - xd(2)) +  c(2) * (x - xd(2)).^2;
s3 = @(x) a(3) + b(3) * (x - xd(3)) +  c(3) * (x - xd(3)).^2;

plot (xd, yd, 'xk', 'MarkerSize', 10);
axis ([2 10 0 4]); 
grid on;
hold on;

xp = linspace (xd(1), xd(2), 20);
yp = s1(xp);
plot (xp, yp, 'r');

xp = linspace (xd(2), xd(3), 20);
yp = s2(xp);
plot (xp, yp, 'b');

xp = linspace (xd(3), xd(4), 20);
yp = s3(xp);
plot (xp, yp, 'g');

pause
%compare to a interpolating 3rd order polynomial
p=polyfit(xd, yd, 3);
xp= linspace(xd(1),xd(4),100);
plot(xp,polyval(p,xp),'k');


hold off;
