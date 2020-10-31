%limits, step size, number of steps and sum
format long;
LL = 0;
UL = 1;
s = 0.01;
n = (UL - LL)/s;
midSum = 0;
x = 0;
deltaX = (UL - LL)/100;
for i=1:n  %100
    %midpoint rule
    x = LL + (i*(deltaX)) - ((deltaX)/2);
    %function
    y = (x^3)/((1 - x^2)^0.5);
    midSum = midSum + y*deltaX;
end
display(midSum);