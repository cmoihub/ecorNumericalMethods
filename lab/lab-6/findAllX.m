function [x] = findAllX(Y)
%FINDALLX returns a vector
% Input: Y
% Output: a vector
abc = [(5-Y) -4 4; -5 4+Y 3; 5 3 1+Y];
d = [1; 4; 2];
x = abc\d;

end
