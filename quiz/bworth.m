function [f] = bworth(fh, fl, n, H)
%BWORTH calculates Butterworth Band Pass input frequency
% Inputs:
%   fh: upper cut off frequency in Hz
%   fl: lower cut off frequency in Hz
%   n: order of the filter
%   H: filter frequency response in Volts/Volts
% Outputs:
%   f: input frequency in Hz

    top = @(f) f^2+fh*fl;
    bottom = @(f) f*(fh-fl);

    H_ = @(f) 1/sqrt(1+(top(f)/bottom(f))^(2*n));

    if(H > H_(2000))
        error('H cannot be greater than the filter frequency response at 2000')
    else
        sol = @(f) H_(f) - H;
        f = fzero(sol, [0 2000]);
    end

end

