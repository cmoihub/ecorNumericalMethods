function [ ratio ] = PRv( M )
%PRv  Given a Mach number, returns the corresponding pressure ratio
%     Vector friendly version of PR
%  Inputs:  M = Mach number (may be a vector of Mach numbers)
%  Outputs: ratio = pressure ratio (stagnation pressure / static pressure)

ratio = ones(size(M)); % preallocate for efficiency
for k = 1:length(M)
  if M(k) <= 1
    ratio(k) = (1 + 0.2 * M(k)^2)^3.5;
  else
    ratio(k) = (1.2 * M(k)^2)^3.5 * ((7/6)* M(k)^2 - 1/6)^-2.5;
  end
end

end

