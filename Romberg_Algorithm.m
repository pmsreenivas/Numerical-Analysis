syms x;
str = input('Give an equation in x: ','s');
f = str2sym(str);
a = 0;
b = 0;
while(a >= b)
    a = input("Enter the beginning of the interval:- ");
    b = input("Enter the end of the interval:- ");
    if(a >= b)
        disp("The beginning must be less than the end, please re enter");
    end
end
n = input("Enter n -> 1 less than the number of rows in the Romberg triangle:- ");
h = b - a;
R00 = (h/2)*(eval(subs(f,a)) + eval(subs(f,b)));
R0 = zeros(n,1);
R = zeros(n,n);
for i = 1:n
    h = h/2;
    sum = 0;
    for k = 1:2:(2^i - 1)
        sum = sum + eval(subs(f,a + k*h));
    end
    if (i == 1)
        R0(i) = 0.5*R00 + sum*h ;
    else
        R0(i) = 0.5*R0(i - 1) + sum*h ;
    end
    for j = 1:i
       if (j == 1); A = R0(i); else; A = R(i,j - 1); end 
       if(i == 1)
           if(j == 1)
               B = R00;
           end
       else
           if(j == 1)
               B = R0(i);
           else
               B = R(i - 1,j - 1);
           end
       end
       R(i,j) = A + (A - B)/(4^j - 1);
    end
end
disp("The required value of the integral is " + num2str(R(n,n)));