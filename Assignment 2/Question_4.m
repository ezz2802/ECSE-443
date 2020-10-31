%initial guess
x0 = 10;

%equate the two equations for power 
f = @(x) (100 - 100*exp(-0.56*x) - 2*x + 5);
f_prime = @(x) 56*(exp(-0.56*x)) - 2; 

%tolerance
e = 10^(-8);

maxIter = 100;

%flag for convergence
convergence = false;

for n = 1 : maxIter
    y = f(x0);
    y_prime = f_prime(x0);
    
    %newton's method
    x1 = x0 - y/y_prime;
   
    if(abs(x1 - x0) <= e)
        convergence = true;
    end
    x0 = x1;
end

if(convergence)
    %x1 is our solution
    disp(x1);
else
    disp("Did not converge");
end

