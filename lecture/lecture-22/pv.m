% Demonstration of ode23; Velocity and Position
function []=pv()
clear
clc

v0=20;
y0=0;
x0=[y0 v0];

[t,x]=ode23(@slope,[0 30], x0);
figure (2)
plot(t,x)
grid on
end

function dx = slope(t,x)
b=10;
c=1.5;
m=200;

dx=zeros(2,1);
dx(1)= x(2);
dx(2) = -(c*x(2) + b*t)/m;
end