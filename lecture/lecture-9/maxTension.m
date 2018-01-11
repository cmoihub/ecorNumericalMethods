function [ Tmax ] = maxTension( L, m, D )
%calcT0 Calculates maximum cable tension
% Inputs: L = cabla length (in m)
%         m = mass per unit length (in kg/m)
%         D = distance between supports (in m)
% OutputsL Tmax = maximum tension (in N)
 
g = 9.81;
calcL = @(T0) ((2 * T0) / (m * g)) * sinh( m * g * D / (2 * T0));
 
lo = eps; hi = 1; % note calcL foes not work for T0 = 0
while calcL(hi) > L  % tension not high enough
    lo = hi; hi = 2 * hi;
end
 
f = @(T0) calcL(T0) - L;
 
T0 = fzero(f, [lo hi]);
 
Tmax = T0 * cosh( m * g * D / (2 * T0));
 
end
