%arrays for x and f(x) values
x = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2 ,2.4];
f_x = [1, 0.916, 0.836, 0.74, 0.624, 0.40, 0.224, 0.24, 0.265, 0.291, 0.316, 0.342, 0.368];

%get first three points
p1 = [x(1), f_x(1)];
p2 = [x(2), f_x(2)];
p3 = [x(3), f_x(3)];

%RHS, LHS and C
LHS = zeros(3);
LHS(1,1) = 1;
LHS(2,1) = p2(1) - p1(1);
LHS(2,2) = ((LHS(2,1))*2) + ((p3(1) - p2(1))*2);
LHS(2,3) = p3(1) - p2(1);
LHS(3,3) = 1;

RHS = [0, 0, 0];
slope12 = (p2(2) - p1(2))/(p2(1) - p1(1));
slope23 = (p3(2) - p2(2))/(p3(1) - p2(1));
RHS(2) = (slope23 - slope12)*3;
RHS = RHS';

C = LHS\RHS;

%we will use s2 so solve for b2 & d2 
b2 = ((p3(2) - p2(2))/(p3(1) - p2(1))) - ((p3(1) - p2(1))/3)*(2*C(2) + C(3));
d2 = (C(2+1) - C(2))/(3*(p3(1) - p2(1)));

%splines; we will use s2 for 0.23
s2 = p2(2) + b2*(0.23 - p2(1)) + C(2)*(0.23 - p2(1))^2 + d2*(0.23 - p2(1))^3;

display(s2);