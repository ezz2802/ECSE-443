%function, limits, true value, and # of steps
syms x y;
f = x^2 + y;
LLy = x;
ULy = 2*x^3;
LLx = 2; 
ULx = 3;
trueY = int(f, y, LLy, ULy); 
trueX = int(trueY, x, 2, 3); 
trueX = double(trueX);
n = 370;

%absolute error
absoluteError = 0;
errorPower = 0;

while (errorPower > -4) 
    n = n + 1; 
    LLy = x; 
    %dyIntegral stores the first integration
    dyIntegral = 0;
    deltaX = (ULy - LLy)/n; 
    %compute integral as long as upper and lower limits not equal 
    while(LLy ~= ULy) 
        %mid point rule
        dyIntegral = dyIntegral + subs(f, y, LLy + (deltaX/2))*(deltaX); 
        LLy = LLy + deltaX; 
    end
    LLx = 2; 
    deltaX = (ULx - LLx)/n; 
    %dxIntegral stores the final value
    dxIntegral = 0; 
    %compute the integral as long as lower limit of x is less than upper limit 
    while(LLx < ULx) 
        %mid point rule 
        dxIntegral = dxIntegral + subs(dyIntegral, x, LLx + (deltaX/2))*(deltaX);
        LLx = LLx + deltaX; 
    end
    
    %error calculation  
    dxIntegral = double(dxIntegral); 
    absoluteError = abs(dxIntegral - trueX); 
    relativeError = absoluteError/trueX;  
    errorPower = ceil(log10(absoluteError)-1); 
end
disp(dxIntegral); 
disp(n);
disp(absoluteError);
disp(relativeError);