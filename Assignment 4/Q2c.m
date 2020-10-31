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
n = 0;

%absolute error
absoluteError = 0;
errorPower = 0;

while (errorPower > -4) 
    n = n + 1; 
    LLy = x; 
    t1 = subs(f, y, LLy); 
    t2 = subs(f, y, ULy); 
    %dyIntegral stores the first integration
    dyIntegral = t1 + t2;
    deltaX = (ULy - LLy)/n; 
    %Simpson rule
    for i=1:2:n-1 
        dyIntegral = dyIntegral + 4*subs(f, y, LLy + i*deltaX); 
    end
    for j=2:2:n-2 
        dyIntegral = dyIntegral + 2*subs(f, y, LLy + j*deltaX); 
    end
    dyIntegral = (deltaX/3)*dyIntegral;
    
    LLx = 2;  
    t3 = subs(dyIntegral, x, LLx); 
    t4 = subs(dyIntegral, x, ULx); 
    %dxIntegral stores the final value
    dxIntegral = t3 + t4; 
    deltaX = (ULx - LLx)/n;
    %Simpson rule
    for i=1:2:n-1 
        dxIntegral = dxIntegral + 4*subs(dyIntegral, x, LLx + i*deltaX); 
    end
    for j=2:2:n-2 
        dxIntegral = dxIntegral + 2*subs(dyIntegral, x, LLx + j*deltaX); 
    end
    dxIntegral = (deltaX/3)*dxIntegral; 
    
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