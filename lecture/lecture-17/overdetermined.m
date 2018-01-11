%ECOR 2606 overdetermined.m describes use of \ operator for least squares
%function fitting

clear
clc
x=[0 1 2 4 5];
y=[1 2 2 3 4];
plot(x,y,'x','MarkerSize',10); hold on;
A=[ x(1) 1; x(2) 1; x(3) 1;x(4) 1; x(5) 1]
%A=[ x(1) 1; x(5) 1];
b=y';
%b=[y(1); y(5)];
p=A\b
%p1=polyfit([x(1) x(5)],[y(1) y(5)],1)
p1=polyfit(x,y,1)
xplot=0:.1:6;
yfit=polyval(p,xplot);
plot(xplot,yfit);
hold off