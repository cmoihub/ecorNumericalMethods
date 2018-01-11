%ECOR 2606  Lecture 17a.m
% basis functions = (1), sin(wx), cos(wx) 
clear
clc
w = 3;
x = 0:0.05:10;
noise = 2*randn(1,length(x));

yt=2-3*sin(w*x)+5*cos(w*x)+noise;
y=yt';

plot(x,y,'o','MarkerSize',3)
fprintf('Type <CR> to continue\n');
pause

	Z = zeros (length(x), 3);
	for k = 1 : length(x)
	    Z(k,1) = 1 ; 
        Z(k,2) = sin (w*x(k)); 
        Z(k,3) = cos (w*x(k)); 
	end

	Zt = Z';

	a = (Zt* Z) \ (Zt * y);   % solve ZtZ a = Zty

    f=@(t) a(1) +a(2)*sin(w*t)+a(3)*cos(w*t);
    yfit=f(x);
    hold on
    plot(x,yfit);
    hold off;
    
    [Q0,R0]=qr(Z,0);
    a1=R0\(Q0'*y);
    fprintf('Fitted equation is %6.2f + %6.2f*sin(%6.2fx) + %6.2f*cos(%6.2fx)\n',a(1), a(2), w, a(3), w);