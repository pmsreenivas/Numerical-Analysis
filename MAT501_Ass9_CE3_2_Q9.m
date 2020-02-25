clc
clear
format long
disp("This program works with the function f(x) = x^3 + 2x^2 + 10x - 20 and its derivative 3x^2 + 4x + 10");
n = 10;
E = 0.5e-5;
x0 = 2;
x(1) = x0;
disp("Initial value is " + num2str(x0) );
x = zeros(1,n + 1);
for i = 2:n + 1
    f = ((x(i-1) + 2)*x(i-1) + 10)*x(i-1) - 20;
    fp = (3*x(i-1) + 4)*x(i-1) + 10;
    x(i) = x(i-1) - f/fp;
    disp("f(x) at the " + num2str(i - 1) + "th iteration is " + num2str(f));
    disp("Derivative of f(x) at the " + num2str(i - 1) + "th iteration is " + num2str(fp));
    disp("x after the " + num2str(i - 1) + "th iteration is " + num2str(x(i)));
    if(abs(x(i) - x(i - 1)) < E)
        break;
    end
end