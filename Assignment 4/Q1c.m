%function, limits, true value, and # of steps
format long;
f = @(x) log(5-4*cos(x));
LL = 0;
UL = pi;
true = integral(f, LL, UL);
n = 0;

%relative error and Simpson sum 
absoluteError = 0;
relativeError = 0; 
errorPower = 0;
simSum = 0;

while ~(errorPower == -6) 
    simSum = 0;
    n = n + 1;
    LL = 0;
    %delta x is difference between bounds divided n-1 
    deltaX = (UL - LL)/(n-1);
    %compute the intgeral for n using Simpson's rule 
    for i=1:n 
        %compute x and y 
        x = LL + ((i-1)*(deltaX)); 
        y = log(5-4*cos(x)); 
        %coefficient we multiply y with based on parity 
        if (mod(i,2) == 0)
            coeff = 4; 
        else
            coeff = 2; 
        end
        if (i == 0)||(i == n) 
            coeff = 1;
        end
        %store in sum
        simSum = simSum + (coeff*deltaX*(1/3)*y); 
    end
    %error calculation 
    absoluteError = abs(simSum - true); 
    relativeError = absoluteError/true;  
    errorPower = ceil(log10(relativeError)-1);
end

disp(n);
disp(midSum);
disp(relativeError);
disp(absoluteError);