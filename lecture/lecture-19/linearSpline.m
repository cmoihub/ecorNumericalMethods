function [ yout ] = linearSpline( x, y, xin )
% function LinearSpline calucaltes linear splines between sets of points
% inputs x, y vectors of interpolating points
%        xin: independent variable where one wants to know the values of y
% outputs yout: vector of dependent variables calculated at xin
 
yout = zeros(size(xin));
for k = 1 : length(xin)
    
    xval = xin(k); % for convenience
    
    lo = 1; hi = length(x);
    if xval < x(lo) || xval > x(hi); error ('x value out of range'); end;
    while hi ~= lo + 1
        m = round((lo + hi) / 2);
        if x(m) <= xval
            lo = m;
        else
            hi = m;
        end
    end
    
    yout(k) = y(lo) + (xval - x(lo))*((y(hi)-y(lo))/(x(hi) - x(lo))) ;
    
end

end
