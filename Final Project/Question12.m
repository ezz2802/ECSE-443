syms x
syms y(x)
%exact using dsolve and diff
%function and conditions
fnc = diff(y, x, 2) + (1/4)*diff(y, x, 1) == 8;
c1 = y(0) == 0;
c2 = y(10) == 0;
exactF = dsolve(fnc, [c1 c2]);
%shooting method
%step size, t's, t range and number of steps
s = 1;
t0 = 0;
t10 = 10;
t = t0:s:t10;
n = length(t) - 1;
t1 = @(t, y1) y1;
t2 = @(t, y1) 8 - y1*(1/4);
%initialize y and y'
y = zeros(n + 1, 1);
dy = zeros(n + 1, 1);
y(1) = 0;
%guess = -41 from trial and error (-41 yields closest result)
dy(1) = -41;
for i=1:n-1
    %R-K
    K1 = t1(y(i), dy(i));
    R1 = t2(y(i), dy(i));
    K2 = t1(y(i) + (K1*s*0.5), dy(i) + (R1*s*0.5));
    R2 = t2(y(i) + (K1*s*0.5), dy(i) + (R1*s*0.5));
    K3 = t1(y(i) + (K2*s*0.5), dy(i) + (R2*s*0.5));
    R3 = t2(y(i) + (K2*s*0.5), dy(i) + (R2*s*0.5));
    K4 = t1(y(i) + (K3*s), dy(i) + (R3*s));
    R4 = t1(y(i) + (K3*s), dy(i) + (R3*s));
    y(i+1) = y(i) + (K1 + 2*K2 + 2*K3 + K4)*s/6;
    dy(i+1) = dy(i) + (R1 + 2*R2 + 2*R3 + R4)*s/6;
end
shootMethod = y;
plot(t,shootMethod,'red');
hold on
fplot(exactF,[0,10],'green')
hold off
legend('Shooting method', 'Exact')