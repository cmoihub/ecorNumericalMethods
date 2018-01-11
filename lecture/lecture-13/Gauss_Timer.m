% Gauss_Timer. Shows the time to complete Gaussian elimination
% K.R. Goheen

clear
clc

pivot =0; %don't use partial pivoting
N=5;
y5=0; y100=0; y500=0; y1000=0; y2000=0;
for i=1:N
A=rand([5,5]);
B=rand([5,1]);
tic
x=naiveGauss(A,B,pivot);
y5=toc+y5
A=rand([100,100]);
B=rand([100,1]);
tic
x=naiveGauss(A,B,pivot);
y100=toc+y100
A=rand([500,500]);
B=rand([500,1]);
tic
x=naiveGauss(A,B,pivot);
y500=toc+y500
A=rand([1000,1000]);
B=rand([1000,1]);
tic
x=naiveGauss(A,B,pivot);
y1000=toc+y1000
A=rand([2000,2000]);
B=rand([2000,1]);
tic
x=naiveGauss(A,B,pivot);
y2000=toc+y2000
end
loglog([5 100 500 1000 2000],[y5/N y100/N y500/N y1000/N y2000/N])
