% Symbolic Math Toolbox Demonstration

syms r v0 g t
h = (1/r)*(v0+g/r)*(1-exp(-r*t))-g*t/r
hdot = diff(h,t)
tmax = solve(hdot,t)

% convert symbolic expression for tmax into a Matlab function
% with 'r' as the first argument and so on
tmaxFunc = matlabFunction (tmax, 'vars', [r v0 g])

% obtain a numeric answer
tmaxFunc (0.35, 78, 9.81) % evaluation function