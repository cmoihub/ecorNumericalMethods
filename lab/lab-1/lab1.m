% Lab 1
% Name: Craig Isesele
% Student No: 100950074

warning('off', 'MATLAB:fplot:NotVectorized')

% Part 1
%a
B_t_1 = 250/(1 + 56.75*exp(-0.17*1));
%b
B_t_4 = 250/(1 + 56.75*exp(-0.17*4));
%c
B_scalar = @(t)250/(1 + 56.75*exp(-0.17*t));
%d
fprintf('Number of bacteria at t = 1 hour is %f\n', B_scalar(1));
%e
fprintf('Number of bacteria at t = 4 hours is %f\n', B_scalar(4));
%f
B = @(t)250./(1 + 56.75*exp(-0.17*t));
fprintf('Number of bacteria at t = 1 or 4 hours is %f\n', B([1 4]));
%g
figure(1)
fplot(B, [0 40]);
title('Growth of E-coli In a Petri Dish');
xlabel('Time (hours)');
ylabel('Number of Bacteria (thousands)');
grid on
%h
% B(t) - 150 = 0
%i
root_finder_ = @ (t) B(t) - 150;
fzero(root_finder, [0 150]);
%j
figure(2)
t = linspace (0, 40, 50);
plot(t, root_finder(t));
title('Growth of E-coli In a Petri Dish');
xlabel('Time (hours)');
ylabel('Number of Bacteria (thousands)');
grid on
%k
fprintf ('The number of bacteria is 150,000 when t = %f hours\n', fzero(root_finder, [25 27]));
% y value is (-150, 100) not (0, 220)

% Part 2


% fzero
root = @(R)1118.406985*R.^2 -11.18407*R -99.96272;
figure(3)
fplot(root, [0 3] );
radius = fzero(root, [0 1]);
diameter = radius*2;
fprintf('diameter from fzero approach is %f\n', diameter);

% roots
p = [1118.406985 -11.18407 -99.96272];
radius = roots(p);
for i = 1:radius
    if radius(i) > 0 
        diameter = radius(i)*2;
    end
end
fprintf('diameter from roots approach is %f\n', diameter);

% Part 3
%{
    brassDensity = 8900 -> mass/volume;
    sphereVolume = 4/3*pi*R^3;%R is the sphere's radius
    sphereMass = 100;
    brassThickness = 0.01;
    brassVolume = sphereVolume - interiorVolume
    interiorVolume = 4/3*pi*[R-thickness]^3
    1 (+a) 3 (-a^2*b) 3 (+b^2*a) 1 (-)
    (R - thickness)^3
    1 * R^3 - 3*R^2*thickness + 3*R*thickness^2-thickness^3
    Therefore brassVolume = 4/3*pi*R^3 - [4/3*pi*R^3 + 
    4*pi*R*thickness^2 - 4/3*pi*thickness^3] = mass/density
    
    4*pi*R^2*0.01 - 4*pi*R*0.01^2 + 4/3*pi*0.01^3 = 100/8900 = 1/89
    
    89*4*pi*R^2*0.01 - 89*4*pi*R*0.01^2 + 89*4/3*pi*0.01^3 = 1
    89*4*pi*R^2*0.01 - 89*4*pi*R*0.01^2 + 89*4/3*pi*0.01^3 -1 = 0 
    Divide everything by 0.01
    1118.40698468R^2 - 11.18406985*R - 99.8881593 = 0
%}