%function, limits, true value, and # of steps
format long;
syms x y;
f = x^2 + y;
LLy = x;
ULy = 2*x^3;
LLx = 2; 
ULx = 3;
trueY = int(f, y, LLy, ULy); 
trueX = int(trueY, x, 2, 3); 
trueX = double(trueX);
n = 550;

%absolute error
absoluteError = 0;
errorPower = 0;

while (errorPower > -4) 
    n = n + 1; 
    LLy = x; 
    %dyIntegral stores the first integration
    dyIntegral = 0;
    deltaX = (ULy - LLy)/n; 
    %compute integral as long as upper and lower limits are not equal 
    while(LLy ~= ULy) 
        %trapezoidal rule 
        y1 = subs(f, y, LLy); 
        y2 = subs(f, y, LLy + deltaX); 
        dyIntegral = dyIntegral + (y1 + y2)*(deltaX/2);
        LLy = LLy + deltaX; 
    end
    LLx = 2; 
    %dxIntegral stores the final value
    dxIntegral = 0; 
    deltaX = (ULx - LLx)/n;
    %compute the integral as long as lower limit of x is less than upper limit 
    while(LLx < ULx) 
        %trapezoidal rule 
        y3 = subs(dyIntegral, x, LLx); 
        y4 = subs(dyIntegral, x, LLx + deltaX); 
        dxIntegral = dxIntegral + (y3 + y4)*(deltaX/2);
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