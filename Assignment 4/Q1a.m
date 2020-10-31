%function, limits, true value, and # of steps
format long;
f = @(x) log(5-4*cos(x));
LL = 0;
UL = pi;
true = integral(f, LL, UL);
n = 0;

%relative error and midpoint sum 
absoluteError = 0;
relativeError = 0; 
errorPower = 0;
midSum = 0;

while ~(errorPower == -6) 
    midSum = 0;
    n = n + 1;
    LL = 0;
    %delta x is difference between bounds divided n 
    deltaX = (UL - LL)/n;
    %compute the intgeral for n using midpoint rule 
    for i=1:n 
        %compute x and y 
        x = LL + i*(deltaX) - (deltaX/2); 
        y = log(5-4*cos(x)); 
        %multiply y and delta x, and store in sum
        midSum = midSum + y*deltaX; 
    end
    %error calculation 
    absoluteError = abs(midSum - true); 
    relativeError = absoluteError/true;  
    errorPower = ceil(log10(relativeError)-1);
end

disp(n);
disp(midSum);
disp(relativeError);
disp(absoluteError);