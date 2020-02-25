clear
clc
format long
syms x
str = input('Give an equation in x: ','s');
f = str2sym(str);
fp = diff(f);
x0 = input('Enter an initial value: ');
x = zeros(1,1000);
x(1) = x0;
E = input('Enter tolerance value: ');
for i = 2:1000
    s = x(i - 1);
    vf = eval(subs(f,s));
    vfp = eval(subs(fp,s));
    x(i) = x(i-1) - vf/vfp;
    disp("f(x) at the " + num2str(i - 1) + "th iteration is " + num2str(vf));
    disp("Derivative of f(x) at the " + num2str(i - 1) + "th iteration is " + num2str(vfp));
    disp("x after the " + num2str(i - 1) + "th iteration is " + num2str(x(i)));
    if(abs(x(i) - x(i - 1)) < E)
        break;
    end
end