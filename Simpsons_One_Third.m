a = 0;
b = 0;
while(a >= b)
    a = input("Enter the beginning of the interval:- ");
    b = input("Enter the end of the interval:- ");
    if(a >= b)
        disp("The beginning must be less than the end, please re enter");
    end
end
n = 1;
while(mod(n,2) ~= 0)
    n = input("Enter the number of intervals:- ");
    if mod(n,2) ~= 0
        disp("The number of intervals must be even, please re enter");
    end
end
syms x;
str = input('Give an equation in x: ','s');
f = str2sym(str);
h = (b - a)/n;
X = a:h:b;
X = X(2:length(X));
v = b - h;
inl = (h/3)*(eval(subs(f,a)) + eval(subs(f,b))) + ((4*h)/3)*eval(subs(f,v));
sum = 0;
for i = 1:(n/2 - 1)
    A = X(2*i - 1);
    B = X(2*i);
    sum = sum + 2*eval(subs(f,A)) + eval(subs(f,B));
end
ansr = inl + ((2*h)/3)*sum;
disp("The value of the integral using  n intervals of Simpsons one third rule is " + num2str(ansr));