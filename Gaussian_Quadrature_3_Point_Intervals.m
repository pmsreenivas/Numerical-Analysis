C = 0;
D = 0;
n = input("Enter the number of intervals:- ");
while(C >= D)
    C = input("Enter the beginning of the interval:- ");
    D = input("Enter the end of the interval:- ");
    if(C >= D)
        disp("The beginning must be less than the end, please re enter");
    end
end
syms x;
str = input('Give an equation in x: ','s');
f = str2sym(str);
r = C:((D - C)/n):D;
sum = 0;
for i = 1:n
    c = r(i);
    d = r(i + 1);
    Alpha = 0.5*(c + d);
    Beta = 0.5*(d - c);
    g = subs(f,x,(Beta*x + Alpha));
    sum = sum + Beta*((5/9)*eval(subs(g,-sqrt(3/5))) + (8/9)*eval(subs(g,0)) + (5/9)*eval(subs(g,sqrt(3/5))));
end
disp("The value of the integral using  n intervals of 3 points of Gaussian Quadrature is " + num2str(sum));
