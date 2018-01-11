function [ x ] = naiveGauss( A, b,pivot, Jordan,nm )
%NAIEVEGAUSS naive Gaussian elimination
% solves Ax = b
% A must be n x n and b must be n x 1
% pivot = 1: use partial pivoting
% Jordan = 1: use Gauss Jordan back substitution
% nm: number of RHSs
% the result is n x 1
 
[n, nn] = size(A); [m, mm] = size(b);
if n ~= nn || n ~= m || mm ~= 1, error 'bad dimensions', end
if nargin < 4,  Jordan=0; nm=1; end
np = n + 1; % a useful value

if pivot == 1 % do partial pivoting
    C = [A b];
for i = 1 : n - 1  % for all pivots
    
    [ pivot, k ] = max(abs(C(i:n, i))); % find best pivot value
    if k ~= 1 % row interchange required - swap row i with row i + (k - 1)
        temp = C(i, :); 
        C(i, :) = C(i + (k - 1), :);
        C(i + (k - 1), :) = temp;
    end
    
    if C(i, i) == 0, error 'no unique solution', end
    
    for k = i + 1 : n % for all rows after pivot row
        C(k, i : np) = C(k, i : np) - (C(k, i) / C(i, i)) * C(i, i : np);
    end
    
end
else 
    C = [A b];
    for i = 1 : n - 1  % for all pivots
        for k = i + 1 : n % for all rows after pivot row
            C(k, i : np) = C(k,i : np) - (C(k, i) / C(i, i)) * C(i, i : np);
        end
    end
end
%
if (Jordan ==0)
    
% back substitution
x = ones(n, 1); % preallocate (column vector)
x(n) = C(n, np) / C(n, n);
for i = n - 1: -1: 1  % work backwards to first equation
    x(i) = (C(i, np) - C(i, i + 1: n) * x (i + 1: n))/C(i, i);
end
else
% Gauss Jordan
 % np is n + 1, nm is n + number of right hand sides

% backward elimination
for i = n : -1 : 2
    for k = i - 1: -1 : 1 % for all rows above pivot
        % only RHS and pivot columns of row k will change 
        C(k, np:nm) = C(k, np:nm) - C(k, i) / C(i, i) * C(i, np:nm);
        C(k, i) = 0;  % why calculate when the answer is known?
    end
end
 
% normalization
for i = 1 : n
    C(i, np:nm) = C(i, np:nm) / C(i, i);
    C(i, i) = 1;
end
 
x = C(:, np:nm);  % extract solution
end
end
