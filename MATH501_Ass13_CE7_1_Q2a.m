h = 1/100;
x0 = zeros(1,91);
x1 = zeros(1,91);
x2 = zeros(1,91);
x3 = zeros(1,91);
x0(1) = 1;
x1(1) = 0 + (x0(1))^2;
x2(1) = 1 + 2*(x0(1))*(x1(1));
x3(1) = 2*((x1(1))^2 + (x0(1))*(x2(1)));
for i = 2:91
    pt = 0 + (i - 1)*h;
    x0(i) = x0(i-1) + h*(x1(i-1)) + ((h^2)*x2(i-1))/2 + ((h^3)*(x3(i-1)))/6;
    cv = x0(i);
    x1(i) = pt + (x0(i))^2;
    x2(i) = 1 + 2*(x0(i))*(x1(i));
    x3(i) = 2*((x1(i))^2 + (x0(i))*(x2(i)));
    disp("The  numerically calculated value at " + num2str(pt) + " is " + num2str(cv));
end