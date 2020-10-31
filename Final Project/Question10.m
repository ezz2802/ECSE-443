%x's, initial condition, step size, number of steps
x0 = 0;
x2 = 2;
y0 = 3;
s = 0.1;
n = (x2-x0)/s;
x = (x0:s:x2)';
y = zeros(10, 1);
%second-order R-K
for i=1:n
    y(1) = y0;
    y1 = -1.2*y(i) + 7*exp(-0.3*x(i));
    y2 = -1.2*(y(i) + s*y1) + 7*exp(-0.3*(x(i) + s));
    y(i+1) = y(i) + (0.5*s)*(y1 + y2);
end
plot(x,y);