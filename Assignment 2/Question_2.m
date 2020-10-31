%input a and b such that f(a)*f(b) < 0
a  = 0;
b = 5;

%tolerance e
e = 10^-8;

%bisection algorithm
while abs(b-a) >= e
    %calculate the midpoint
    c = (a+b)/2;
    f_c = c^3 - 2*c^2 + (4/3)*c - 8/27;
    f_a = a^3 - 2*a^2 + (4/3)*a - 8/27;
    
    if f_c*f_a > 0
       %solution is [c,b]
       a = c;
    else
       %solution is [a,c]
       b = c;
    end
end

%display the root
display(c);