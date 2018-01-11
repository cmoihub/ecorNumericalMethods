clear
clc

%define symbolic variables 
syms t g cd m f h h1

%velocity equation
f= (sqrt(g.*m/cd)).*tanh(sqrt(g.*cd/m).*t)

%displays the symbolic function simmilar to how you would actually write it
pretty(f)

%intigrates the function h with 'f' w.r.t  't'
h=int(f,t)

%simplifies the symbolic equation 'h'
h1=simple(h);


pretty(h1)

%define constants
g=9.81;
m=68.1;
cd=0.25;
tl=4;
th=7;

gs=int(f, t, tl, th);
digits(8)


fprintf('the value of the integral is: ');
vpa(gs)