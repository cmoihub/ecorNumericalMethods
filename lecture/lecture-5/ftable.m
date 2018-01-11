function [  ] = ftable( f, vector)
%ftable Produces table of function values.
% Inputs:  f = function to be tabulated
%          vector = vector of values for the independent variable
% No Outputs (like a C++ void function)
 
fprintf ('  Independent      Dependent\n');

%for k = 1 : length(vector)
%    x = vector(k);
%    y = f(x);
%    fprintf ('%12f%16f\n', x, y);
%end
% To improve the finction, replace the loop above with
for x = vector
    fprintf ('%12f%16f\n', x, f(x));
end

end
