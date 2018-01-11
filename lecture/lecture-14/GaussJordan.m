function [ x ] = GaussJordan( A, b )
%GAUSSJORDAN Gauss-Jordan elimination
% solves Ax = b
% A must be n x n and b must be n by m
% the result is n x m

[n, nn] = size(A); [m, mm] = size(b);
if n ~= nn || n ~= m , error 'bad dimensions', end

np = n + 1; nm = n + mm; % useful values

C = [A b];
for i = 1 : n - 1  % for all pivots
    
    [ pivot, k ] = max(abs(C(i:n, i)));
    if k ~= 1 % row interchange required - swap row i with row i + (k - 1)
        temp = C(i, :); 
        C(i, :) = C(i + (k - 1), :);
        C(i + (k - 1), :) = temp;
    end
    
    if C(i, i) == 0, error ('no unique solution'), end
    
    for k = i + 1 : n % for all rows after pivot row
        C(k, i : nm) = C(k, i : nm) - (C(k, i) / C(i, i)) * C(i, i : nm);
    end
    
end

if C(n, n) == 0, error ('no unique solution'), end

%backward elimination
for i = n : -1 : 2
    for k = i - 1: -1 : 1 % for all rows above pivot
        % only RHS and pivot columns of row k will change 
        C(k, np:nm) = C(k, np:nm) - C(k, i) / C(i, i) * C(i, np:nm);
        C(k, i) = 0; % why calculate when the answer is known?
    end
end

for i = 1 : n
    C(i, np:nm) = C(i, np:nm) / C(i, i);
    C(i, i) = 1;
end

x = C(:, np:nm);

end


