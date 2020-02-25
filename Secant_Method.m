clear
format long
syms x
str = input('Give an equation in x: ','s');
f = str2sym(str);
x1 = input('Enter the 1st initial estimate: ');
x2 = input('Enter the 2nd initial estimate: ');
epsi = input('Enter a positive tolerance such that the iteration stops if the difference between 2 consecutive iterates is less than this: ');
delta = input('Enter a positive tolerance such that the iteration stops if the function value is smaller than this: ');
maxf = input('Enter the maximum number of iterations allowed: ');
x = 0;
ierr = 0;
fc = 0;
xx = zeros(1,maxf + 2);
xx(1) = x1;
xx(2) = x2;
for i = 3:maxf + 2
    a = xx(i - 2);
    b = xx(i - 1);
    fa = eval(subs(f,a));
    fb = eval(subs(f,b));
    xx(i) = b - ((b - a)/(fb - fa))*fb;
    c = xx(i);
    fc = eval(subs(f,c));
    if((abs(xx(i) - xx(i-1)) < epsi) || abs(fc) < delta)
        ierr = 1;
        x = xx(i);
        break;
    end
end
str = "The final estimate of the solution is " + num2str(x) + " and the value of the function at this point is " + num2str(fc);
disp(str);
