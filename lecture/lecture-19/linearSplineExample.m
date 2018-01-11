clear
clc
xd = [ 3.0 4.5 7.0 9.0 ];
yd = [ 2.0 1.0 2.5 0.5 ];
xplot=linspace(3, 9, 100);
p=polyfit(xd,yd,length(xd)-1);
youtl=interp1(xd,yd, xplot,'linear');
youts=interp1(xd,yd,xplot,'spline');
youtp=polyval(p,xplot);
plot (xd, yd, 'xk', xplot, youtl,'r',xplot,youts,'-g',xplot,youtp,'-.b','MarkerSize', 10);
axis ([2 10 0 4]); 
grid on;
hold on;


hold off;
