% Demonstration of ode23; Velocity and Position for a 2nd order de
function []=secondOrder()
clear
clc


v0=10;
y0=5;

[t,y]=ode23(@slope,linspace(0,20,101), [y0 v0]);
figure (1)
plot(t,y)
grid on
end

function dy = slope(t,y)
k=2;
c=0.5;
m=1;

dy=zeros(2,1);
dy(1)= y(2);
dy(2) = -(k/m)*y(1) - (c/m)*y(2);
end