% Demonstration of ode23; Velocity and Position for a 2nd order de, 2
% coupled masses
function []=twomass()
clear
clc


v10=0;
y10=5;
v20=0;
y20=-5;

[t,y]=ode23(@slope,linspace(0,20,101), [y10 v10 y20 v20]);
figure (1)
plot(t,y(:, 1:2:3))
grid on
end

function dy = slope(t,y)
k1=2;
c1=0.5;
m1=1;

k2=4;
c2=0.7;
m2=2;

F= @(t) 0;

dy=zeros(4,1);
dy(1)= y(2);
dy(2) = -(k1/m1)*y(1) - (c1/m1)*y(2) -k2/m1*(y(1)-y(3)) - c2/m1*(y(2)-y(4));
dy(3) = y(4);
dy(4) = k2/m2*(y(1)-y(3)) + c2/m2*(y(2)-y(4)+ F(t)/m2);
end