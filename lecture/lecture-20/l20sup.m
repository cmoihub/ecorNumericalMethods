clear
clc
syms t g cd m f h h1 
f=(sqrt(g.*m./cd)).*tanh((sqrt(g.*cd./m)).*t);
pretty(f)
h=int(f,t);
h1=simple(h);
pretty(h1)
g=9.81;
m=68.1;
cd=0.25;
tl=4;
th=7;

gs=int(f,t,tl,th);
digits(8)

fprintf('The value of the integral is ' );
vpa(gs)
