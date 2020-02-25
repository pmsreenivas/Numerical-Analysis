h = 1/100;
x0 = zeros(1,76);
x1 = zeros(1,76);
x2 = zeros(1,76);
x3 = zeros(1,76);
x0(1) = 1;
x1(1) = x0(1) - 1;
x2(1) = x1(1) - 1;
x3(1) = x2(1);
for i = 2:76
    pt = 1 + (i - 1)*h;
    x0(i) = x0(i-1) + h*(x1(i-1)) + ((h^2)*x2(i-1))/2 + ((h^3)*(x3(i-1)))/6;
    cv = x0(i);
    x1(i) = x0(i) - pt;
    x2(i) = x1(i) - 1;
    x3(i) = x2(i);
    disp("The  numerically calculated value at " + num2str(pt) + " is " + num2str(cv));
end