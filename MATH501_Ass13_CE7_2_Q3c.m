n = input("Enter the value of n:- ");
h = 2^-n;
syms x t;
f = 1/t^2 - x/t -x^2;
iv = input("Enter the initial value of x:- ");
xt = iv;
for pt = 1 + h:h:2
    k1 = h*eval(subs(f,[x,t],[xt,pt]));
    k2 = h*eval(subs(f,[x,t],[xt + 0.5*k1,pt + 0.5*h]));
    k3 = h*eval(subs(f,[x,t],[xt + 0.5*k2,pt + 0.5*h]));
    k4 = h*eval(subs(f,[x,t],[xt + k3,pt + h]));
    xt = xt + (k1 + 2*k2 + 2*k3 + k4)/6;
end
RKM = xt;
m = 1/h + 1;
x0 = zeros(1,m);
x1 = zeros(1,m);
x2 = zeros(1,m);
x3 = zeros(1,m);
x4 = zeros(1,m);
x0(1) = iv;
x1(1) = (1)/(1)^2 - x0(1)/1 - (x0(1))^2;
x2(1) = (-2)/(1)^3 - x1(1)/1 - x0(1)/1^2 - 2*(x0(1))*(x1(1));
x3(1) = (6)/(1)^3 - x2(1)/1 + (3*x1(1))/1^2 - (2*x0(1))/1^3 - 2*(x1(1))^2 - 2*(x0(1))*(x2(1));
x4(1) = (-24)/(1)^4 + (5*x2(1))/1^2 - (x3(1))/1 - (9*x1(1))/1^4 - 4*(x1(1))*(x2(1)) - 2*(x2(1))^2 - 2*(x0(1))*(x3(1));
for i = 2:m
    pt = 1 + (i - 1)*h;
    x0(i) = x0(i-1) + h*(x1(i-1)) + ((h^2)*x2(i-1))/2 + ((h^3)*(x3(i-1)))/6 + ((h^4)*(x4(i-1)))/24;
    cv = x0(i);
    x1(i) = (1)/(pt)^2 - x0(i)/pt - (x0(i))^2;
    x2(i) = (-2)/(pt)^3 - x1(i)/pt - x0(i)/pt^2 - 2*(x0(i))*(x1(i));
    x3(i) = (6)/(pt)^3 - x2(i)/pt + (3*x1(i))/pt^2 - (2*x0(i))/pt^3 - 2*(x1(i))^2 - 2*(x0(i))*(x2(i));
    x4(i) = (-24)/(pt)^4 + (5*x2(i))/pt^2 - (x3(i))/pt - (9*x1(i))/pt^4 - 4*(x1(i))*(x2(i)) - 2*(x2(i))^2 - 2*(x0(i))*(x3(i));
end
TS = cv;
disp("x(2) is " + num2str(RKM) + " using the Runge Kutta method and " + num2str(TS) + " using the Taylor Series method");
