function[] = quiz2_()
    figure(1)
    ylabel('H')
    xlabel('f')
    title('H vs f')
    fplot(func, [0.1 0.975]);

    figure(2)
    ylabel('H')
    xlabel('f')
    title('H vs f')
    f = linspace(0.1, 0.975, 100);
    H = zeros(size(f));
    for k = 1:length(f)
        H(k) = func(f(k));
    end
    plot(f, H);

    fprintf('Response (V/V) Freq (Hz)\n'); 
    for k = 0.1:0.025:0.975
        fprintf('%f      %f\n', k, func(k));
    end
    
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
end