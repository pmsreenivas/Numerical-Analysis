h = 1/100;
f = @(t) exp(t)/(16 - exp(t));
x0 = zeros(1,178);
x1 = zeros(1,178);
x2 = zeros(1,178);
x3 = zeros(1,178);
x4 = zeros(1,178);
x5 = zeros(1,178);
x0(1) = exp(1)/(16 - exp(1));
x1(1) = x0(1) + (x0(1))^2;
x2(1) = x1(1)*(1 + 2*x0(1));
x3(1) = 2*(x1(1))^2 + (x2(1))*(1 + 2*x0(1));
x4(1) = 6*(x1(1))*(x2(1)) + (x3(1))*(1 + 2*x0(1));
x5(1) = 6*(x2(1))^2 + 8*(x1(1))*(x3(1)) + (x4(1))*(1 + 2*x0(1));
for i = 2:178
    pt = 1 + (i - 1)*h;
    av = feval(f,pt);
    x0(i) = x0(i - 1) + h*(x1(i-1)) + ((h^2)*(x2(i-1)))/2 + ((h^3)*(x3(i-1)))/6 + ((h^4)*(x4(i-1)))/24 + ((h^5)*(x5(i-1)))/120 ;
    cv = x0(i);
    x1(i) = x0(i) + (x0(i))^2;
    x2(i) = x1(i)*(1 + 2*x0(i));
    x3(i) = 2*(x1(i))^2 + (x2(i))*(1 + 2*x0(i));
    x4(i) = 6*(x1(i))*(x2(i)) + (x3(i))*(1 + 2*x0(i));
    x5(i) = 6*(x2(i))^2 + 8*(x1(i))*(x3(i)) + (x4(i))*(1 + 2*x0(i));
    disp("The  numerically calculated value at " + num2str(pt) + " is " + num2str(cv));
    disp("The actual value at " + num2str(pt) + " is " + num2str(av));
end