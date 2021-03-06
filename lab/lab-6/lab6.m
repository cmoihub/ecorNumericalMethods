function [] = lab6 ()
    % the commands required to produce the required output for parts 1 and 2 go here 
    % this is your "script"
    % Craig Isesele 100950074 - Lab 6
    
    % Part 1
    abc = [2 -14 5; 5 6 -2; 1 5 3];
    d = [52; 2; 17];

    
    sol1=inv(abc)*d;
    sol2=abc^-1*d;
    sol3=abc\d;

    printAll = @(f) fprintf('The values of a is %f, b is %f and c is %f\n', f);
    printOne = @(f, pos) fprintf('The values of b is %f\n', f(pos));

    printAll(sol1);
    printOne(sol1, 2);
    printAll(sol1);
    printOne(sol1, 2);
    printAll(sol1);
    printOne(sol1, 2);

%     2    -14    5    52
%     5     6    -2    2
%     1     5     3    17
% 
% row = row ? (element below pivot/ pivot) * pivot row 
% 
% (2,2) = 6 - (5/2) * -14 = 41
% (2,3) = -2 - (5/2) * 5 = -14.5
% (2,4) = 2 - (5/2) * 2 = -128
% 
% (3,2) = 5 - (1/2) * -14 = 12
% (3,3) = 3 - (1/2) * 5 = 0.5
% (3,4) = 17 - (1/2) * 52 = -9
% 
% 2    -14      5          52
% 0      41   -14.5      -128
% 0      12     0.5        -9
% 
% (3,3) = 0.5 - (12/41) * -14.5 = 4 61/82
% (3,4) = -9 - (12/41) * -128 = 28 19/41
% 
% 2    -14    5                52
% 0     41   -14.5           -128
% 0     0       4 61/82     28 19/41
% 
% 1. 2a-14b+5c=52
% 2. 41b - 14.5c = 128
% 3. 4 61/82c=28 19/41
% c = 6
% For 2 41b - 14.5c = -128
% b = (14.5c-128)/41 = -1
% b = -1
% For 3 2a-14b+5c=52
% a = 4
    
    % Part 2
    printAll(findAllX(0));
    figure(1)
    fplot(@findX1, [0 12])
    grid on;
    title('findX1')
    xlabel('y')
    ylabel('x1')

    figure(2)
    y  = linspace(0, 12, 100);
    x1 = zeros(size(y));
    for k = 1:length(y)
        x1(k) = findX1(y(k));
    end
    plot(y, x1)
    grid on;
    title('findX1')
    xlabel('x1')
    ylabel('y')
    
    a = fminbnd(@findX1,0,12);
    g = findX1(a);
    fprintf('The minimum value for x1 from 0 to 12 is %f and x1 equals %f\n',a,g);
    
    
    
    function [x1] = findX1 (Y)
        % solves system and returns value of x1 only % should make use of "findAllX"
        x = findAllX(Y);
        x1 = x(1);
    end
    function [x] = findAllX (Y)
        % solves system of equations and returns a vector of x values 
        % Input: Y
        % Output: a vector
        abc = [(5-Y) -4 4; -5 4+Y 3; 5 3 1+Y];
        d = [1; 4; 2];
        x = abc\d;
    end
end