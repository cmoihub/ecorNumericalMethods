function [area] = overlap(R1, R2, D)
%OVERLAP calculates overlap area of 2 circles
%Inputs
%R1=radius of circle 1
%R2=radius of circle 2
%D=distance between the centres of the circles
%Outputs
%area = Area of overlap (mm^2)

% Craig Isesele (100950074)

% Case 1
if R1<=0 || R2<=0 || D < 0 
    error('Invalid inputs - minimum input values are overlap (1,1,0)')
end
% Case 2
if D>=(R1+R2)
    area = 0;
%     fprintf('the circles don''t overlap\n')
    return
end
% Case 3
if D<abs(R1-R2)
    r = min(R1, R2);
    area = pi*r^2;
%     fprintf('one circle is completely inside another\n')
    return
end

% Case 4
x1 = (D^2+R1^2-R2^2)/(2*D);
x2 = D-x1;

A = @(x,R) ((pi*R.^2)/2) - (x.*sqrt(R.^2-x.^2) + R.^2*asin(x/R));
area = A(x1,R1) + A(x2,R2);
return
end

