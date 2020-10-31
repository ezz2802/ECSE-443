syms x
syms y(x)
%exact using dsolve and diff
%function and conditions
fnc = diff(y, x, 2) + (1/4)*diff(y, x, 1) == 8;
c1 = y(0) == 0;
c2 = y(10) == 0;
exactF = dsolve(fnc, [c1 c2]);
%yh = y + h, y_h = y - h
syms y
syms yh
syms y_h
%finite difference method
%step size, t's, t range, number of steps, and equ
eq = 8;
s = 1;
t0 = 0;
t10 = 10;
t = t0:s:t10;
n = 1 + (t10 - t0)/s;
%prepare equations
dydt = (yh - y_h)/2*s;
d2ydt2 = (yh - 2*y + y_h)/s^2;
%finite difference equation
fnc(y_h, y, yh) = dydt/4 + d2ydt2;
%set A and B
A(1:n,1:n)=0;
A(1,1)=1;
A(n,n)=1;
%fill A coefficients
for i=2:n-1
    A(i,i-1) = fnc(1,0,0);
    A(i,i) = fnc(0,1,0);
    A(i,i+1) = fnc(0,0,1);
end
B(1:n,1)=0;
B(2:n-1,1)=eq;
finiteD = (A'*A)\(A'*B);
plot(t,finiteD,'red');
hold on
fplot(exactF,[0,10],'green')
hold off
legend('Finite Diff', 'Exact')