k = 1:2:15;
for i = k
    vector = [1 i -1./i 2];
    rmax = maxroot(vector);
    fprintf('value of i is %d & rmax is %f\n', i, rmax);    
end

g = @(x) x.^3 - 2*x.^2 - x/2 + 2;
fprintf('xl, xu, Difference\n')

for k = 0:10
    xl = k-1;
    xu = k+1;
    diff = diffy(g, xl, xu);
    fprintf('%.3f, %.3f, %.3f\n', xl, xu, diff);
    
    figure(2)
    xlabel('x')
    ylabel('y')
    fplot(g, [xl, xu])
    hold on
    grid on
end

hold off