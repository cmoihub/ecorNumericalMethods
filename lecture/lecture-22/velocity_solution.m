% Demonstration of ode23; Velocity
clear
clc
b=10;
c=1.5;
m=200;
v0=20;
vp=@(t,v) -(c*v + b*t)/m;
[t,v]=ode23(vp,[0 30], v0);
figure (1)
plot(t,v)
grid on
hold on
pause

% demonstrate how to use trapz to calculate s
s=zeros(1,length(t));
for i =1:length(v)
    s(1,i) = trapz(t(1:i),v(1:i));
end

plot(t,s,'r-.')
hold off
