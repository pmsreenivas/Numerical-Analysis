c = 0;
d = 0;
while(c >= d)
    c = input("Enter the beginning of the interval:- ");
    d = input("Enter the end of the interval:- ");
    if(c >= d)
        disp("The beginning must be less than the end, please re enter");
    end
end
syms x;
str = input('Give an equation in x: ','s');
f = str2sym(str);
Alpha = 0.5*(c + d);
Beta = 0.5*(d - c);
g = subs(f,x,(Beta*x + Alpha));
asw = Beta*((5/9)*eval(subs(g,-sqrt(3/5))) + (8/9)*eval(subs(g,0)) + (5/9)*eval(subs(g,sqrt(3/5))));
disp("The value of the integral using 3 points of Gaussian Quadrature is " + num2str(asw));