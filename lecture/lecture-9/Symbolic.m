%Script file for ECOR 2606 Lecture 9
% Demonstrates Symbolic Math Toolbox
clear
clc
syms  r v0 g t
h = (1/r)*(v0+g/r)*(1-exp(-r*t))-g*t/r
hdot=diff(h,t)
tmax=solve(hdot,t)
g=9.81;r=0.35;v0=78;
t=subs(tmax)
hmax=subs(h)

%  or

% h = '(1/r)*(v0+g/r)*(1-exp(-r*t))-g*t/r'
%hdot = diff(h, t)

