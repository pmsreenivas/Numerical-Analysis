a = 0;
b = 0;
while(a >= b)
    a = input("Enter the beginning of the interval:- ");
    b = input("Enter the end of the interval:- ");
    if(a >= b)
        disp("The beginning must be less than the end, please re enter");
    end
end
n = input("Enter the number of intervals:- ");
syms x;
str = input('Give an equation in x: ','s');
f = str2sym(str);
h = (b - a)/n;
X = a:h:b;
sum = 0;
for i = 1:n
    xi = X(i);
    xip1 = X(i + 1);
    fval = 0.5*(xi + xip1);
    sum = sum + (xip1 - xi)*eval(subs(f,fval));
end
disp("The integral of the function over the given limits is " + num2str(sum));