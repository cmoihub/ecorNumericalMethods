function [  ] = DIYfplot( f, range )
%DIYfplot Do it yourself version of fplot. Plots a function over a range.
% Inputs:  f = function to be plotted
%          range = two element vector containing start and end of range
% No Outputs (like a C++ void function)
 
n = 100; % number of points
 
x = linspace (range(1), range(2), n); % generate x values
 
% generate y values
y = zeros ([1 n]); % preallocate for efficiency
for k = 1 : n
    y(k) = f(x(k));
end

plot (x, y);

end
