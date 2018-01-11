D = input ('Enter D: '); m = input ('Enter m: ');
 
Tfunc = @(L) maxTension (L, m, D);
 
fplot (Tfunc, [D * 1.01, D * 2]);
grid on;
xlabel ('Length (metres)');
ylabel ('Max tension (Newtons)');
 
% bracket the minimum
L1 = D * 1.001; L2 = D * 1.002; T2 = Tfunc(L2);
while 1
    L3 = L2 + 1; T3 = Tfunc(L3);
    if T3 > T2  % tension has started going up
        break;
    end;
    L1 = L2; L2 = L3; T2 = T3;
end
 
bestL = fminbnd (Tfunc, L1, L3);
 
fprintf ('Best length is %4.2fm.\n', bestL);
fprintf ('The minimum Max tension is %4.2fN.\n', Tfunc(bestL));