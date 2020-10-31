x = [0, 1, 2, 3, 4]; 
f = [30, 33, 28, 12, -22]; 
%step size
h = 1;

f0FirstOrder = (-f(3) + 4*f(2) -3*f(1))/2*h; 
f2FirstOrder = (-f(5) + 4*f(4) -3*f(3))/2*h; 
f4FirstOrder = (3*f(5) - 4*f(4) + f(3))/(2*h); 
f0SecondOrder = (-f(4) + 4*f(3) - 5*f(2) + 2*f(1))/(h^2); 

disp(f0FirstOrder); 
disp(f2FirstOrder); 
disp(f4FirstOrder); 
disp(f0SecondOrder);