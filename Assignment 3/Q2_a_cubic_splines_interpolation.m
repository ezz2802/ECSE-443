%arrays for x and f(x) values
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2 ,2.4];
f_x = [1, 0.916, 0.836, 0.74, 0.624, 0.40, 0.224, 0.24, 0.265, 0.291, 0.316, 0.342, 0.368];

%get first three points
p1 = [x(4), f_x(4)];
p2 = [x(5), f_x(5)];
p3 = [x(6), f_x(6)];

%RHS, LHS and C
RHS = [0, 0, 0];
slope12 = (p2(2) - p1(2))/(p2(1) - p1(1));
slope23 = (p3(2) - p2(2))/(p3(1) - p2(1));
RHS(2) = (slope23 - slope12)*3;
RHS = RHS';

LHS = zeros(3);
LHS(1,1) = 1;
LHS(2,1) = p2(1) - p1(1);
LHS(2,2) = ((LHS(2,1))*2) + ((p3(1) - p2(1))*2);
LHS(2,3) = p3(1) - p2(1);
LHS(3,3) = 1;

C = LHS\RHS;

%we will use s1 so solve for b1 & d1 
b1 = ((p2(2) - p1(2))/(p2(1) - p1(1))) - ((p2(1) - p1(1))/3)*(2*C(1) + C(2)); 
d1 = (C(1+1) - C(1))/(3*(p2(1) - p1(1)));

%splines; we will use s1 for 0.78
s1 = p1(2) + b1*(0.78 - p1(1)) + C(1)*(0.78 - p1(1))^2 + d1*(0.78 - p1(1))^3;

display(s1);