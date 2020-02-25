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
for i = 1:n + 1
    xval = X(i);
    if (i == 1 || i == n + 1)
        sum = sum + 0.5 * eval(subs(f,xval));
    else
        sum = sum + eval(subs(f,xval));
    end
end
sum = h * sum;
disp("The integral of the function over the given limits is " + num2str(sum));