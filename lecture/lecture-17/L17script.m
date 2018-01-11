clear
clc

x =   [   -8.0   -6.0   -4.0   -2.0     0    2.0    4.0    6.0    8.0]';
y =   [ -817.5 -279.9 -139.4  -41.6  -23.8   -8.7   36.0  158.1  339.4 ]';

p = polyfit (x, y, 3);

% p is  1.1105   -3.2687   0.2947   0.7874

f = @(x) p(1) * x .^ 3 + p(2) * x .^ 2 + p(3) * x + p(4);
r = correlate (x, y, f);

% r is  0.9936

%We can also use general least squares regression with 

%	z0(x) =x3,  z1(x) =x2,  z2(x) =x,   z3(x) =1 

% Creating Z:
pause
Z = zeros (length(x), 3);  % pre allocate for efficiency
for k = 1 : length(x)
    Z(k, 1) = x(k)^3; 
    Z(k, 2) = x(k)^2; 
    Z(k, 3) = x(k); 
    Z(k, 4) = 1;
end

%Using normal equations:

Zt = Z';
 
a = (Zt* Z) \ (Zt * y)   % solve Zt Z a = Zt y

% a’ is  1.1105   -3.2687    0.2947    0.7874

%Normal equations perhaps not a very good idea here (although the answer is OK):

c = cond(Zt* Z);

% c is 1.5999e+005,  the matrix is very ill conditioned

%Using QR decomposition:

[Q0, R0] = qr(Z, 0);
 
a = R0 \ (Q0' * y);

% a’ is  1.1105   -3.2687    0.2947    0.7874

%Using left division:

a1= Z \ y

% a’ is  1.1105   -3.2687    0.2947    0.7874

