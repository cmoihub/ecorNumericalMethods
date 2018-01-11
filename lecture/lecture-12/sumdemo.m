function sout= sumdemo()
% sumdemo demonstrates rounding errors
% inputs: none
% outputs : sout 
format long
    s= 0;
    for i = 1:10000
        s = s + 0.0001;
    end
    sout = s
end