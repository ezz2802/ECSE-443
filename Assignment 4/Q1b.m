%function, limits, true value, and # of steps
format long;
f = @(x) log(5-4*cos(x));
LL = 0;
UL = pi;
true = integral(f, LL, UL);
n = 0;

%relative error and trapezoidal sum 
absoluteError = 0;
relativeError = 0; 
errorPower = 0;
trapSum = 0;

while ~(errorPower == -6) 
    trapSum = 0;
    n = n + 1;
    LL = 0;
    %delta x is difference between bounds divided n-1 
    deltaX = (UL - LL)/(n-1);
    
    for i=1:n 
        %compute x and y 
        x = LL + ((i-1)*(deltaX)); 
        y = log(5-4*cos(x)); 
        if (i == 0)||(i == n) 
            coeff = 0.5; 
        else
            coeff = 1; 
        end
        %store in sum 
        trapSum = trapSum + (coeff*deltaX*y); 
    end
    %error calculation 
    absoluteError = abs(trapSum - true); 
    relativeError = absoluteError/true;  
    errorPower = ceil(log10(relativeError)-1);
end

disp(n);
disp(midSum);
disp(relativeError);
disp(absoluteError);