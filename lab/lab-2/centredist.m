function [d] = centredist(R1, R2, area)

%OVERLAP calculates overlap area of 2 circles
%Inputs
%R1=radius of circle 1
%R2=radius of circle 2
%area = Area of overlap (mm^2)
%Outputs
%D=distance between the centres of the circles

% Craig Isesele (100950074)

if R1<=0 || R2<=0 || area<=0
    error('Inputs must be greater than zero');
end

r = min(R1, R2);
area_ = pi*r^2;

if area >= area_
    error('Invalid inputs')
end

g = @(D) overlap(R1,R2,D) - area;
d = fzero(g,[abs(R1-R2), (R1+R2)]);

end