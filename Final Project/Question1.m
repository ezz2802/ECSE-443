%function, limits and true value
format long;
syms x;
f = @(x) 1/(exp(x) + exp(-x));
LL = 0;
UL = inf;
trueValue = int(f(x), LL, UL);
%number of steps, step size, accuracy, relative error and sum
n = 0;
s = 0;
acc = 0.0001;
relativeError = 100;
simSum = 0;
while(relativeError > acc)
    %large upper limit = 100
    s = (100 - LL)/n;
    simSum = 0;
    for i=1:n
        %simpson's rule
        add = (s/6)*(f(LL + (i-1)*s) + f((LL + (i-1)*s) + s) + 4*f((LL + (i-1)*s) + s/2));
        simSum = simSum + add;
    end
    relativeError = abs(simSum - trueValue)/trueValue;
    n = n + 1;    
end
display(simSum);
display(trueValue);