clear
clc
xd = [ 3.0 4.5 7.0 9.0 ];  yd = [ 2.0 1.0 2.5 0.5 ];  % data points
m = length(xd) - 1; % number of splines
 
a = yd(1:m);   % Math 1 - find values for a1, a2, ... aM
 
% Math 2 and Math 3 - setup 2*M equations in 2*M unknowns
% The  unknowns are b1, b2, ...bM  and c1, c2, ... cM (in that order)

A = zeros (2*m, 2*m);
for i = 1:m
    deltaX = xd(i+1)-xd(i);
    A(i,i) = deltaX;  A(i,m+i) = deltaX^2;
    if i ~= m
        A(m+i,i) = 1;  A(m+i,i+1) = -1; A(m+i, m+i) = 2 * deltaX;
    end
end
A(2*m,m+1) = 1;  % c1 = 0
 
B = [yd(2:m+1)-yd(1:m) zeros(1,m)]';

sol = A \ B;
 
b = sol(1:m)'; % extract values for b1, b2, ... bN
c = sol(m+1:2*m)'; % extract values for c1, c2, ... cN

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
