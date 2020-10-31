%step size, range, function
h = 0.01; 
x = -pi:h:pi; 
f = sin(x);
%compute derivatives using finite difference  
y1 = diff(f)/h;  
y2 = diff(y1)/h;  
y3 = diff(y2)/h; 
y4 = diff(y3)/h; 
y5 = diff(y4)/h; 

plot(x(:,1:length(y1)),y1,'g', x(:,1:length(y2)),y2,'y', x(:,1:length(y3)),y3,'c', x(:,1:length(y4)),y4,'m', x(:,1:length(y5)),y5,'r') 
grid
%Q3b
%step size, range, function
h = 0.001;  
x = -pi:h:pi; 
f = sin(x); 
sum = zeros(1, length(f)-3); 
%compute forward difference representation 
for i=1:(length(f)-3) 
    sum(i) = ((-11/6)*f(i) + (3)*(f(i+1)) - (1.5)*f(i+2) + (1/3)*f(i+3))/h; 
end

figure; 
plot(x(:,1:length(sum)), sum, 'r');
grid