function [ x, flag, k ] = Jacobi( A, b, x0, tol, maxk, disp)
%JACOBI solves Ax = b using Jacobi iteration
% Inputs: A = n x n coefficient matrix
%         b = n x 1 right hand side
%         x0 = n x 1 initial guess
%         tol = tolerance, iteration ends when the norm of the change in
%               x becomes less than tol
%         maxk = maximum iterations
%         disp = display option 0 (default) = no display
% Outputs: x = n x 1 solution
%          flag = set to 1 on success, 0 on failure (max iterations)
%          k = iterations

if nargin < 6, disp = 0; end

[n, nn] = size(A); [m, mm] = size(b);
if n ~= nn || n ~= m || mm ~= 1, error ('bad dimensions'), end

% generate the iteration matrices C and d
C = zeros(size(A)); d = zeros(size(b));
for i = 1 : n
    if A(i, i) == 0, error ('zero diagonal element'), end
    C(i, :) = -A(i, :) / A(i, i);  
    C(i, i) = 0;
    d(i) = b(i) / A(i, i);
end

x = x0;

for k = 1: maxk

    xold = x;
    x = C * xold + d;
    
    if disp
        fprintf ('%3d', k);
        for i = 1 : n
            fprintf ('%12f', x(i));
        end
        fprintf('\n');
    end
 
    if norm(x - xold) < tol
        flag = 1; return; % solution has converged
    end 
end
flag = 0
end

%flag = 0; % no convergance

