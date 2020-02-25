syms u;
n = 20;
x0 = -5;
x = -4.5:.5:5;
f = @(x) (x^2 + 1)^-1;
y0 = f(x0);
y = zeros(1,length(x));
for i = 1:length(x)
    y(i) = f(x(i));
end
a0 = y0;
for i = 1:n
    a(i) = y(i);
end
for j = 1:n
    for i = n:-1:j
       if(i==0);A=a0;else;A=a(i);end
       if(i==1);B=a0;else;B=a(i-1);end
       if(i==0);C=x0;else;C=x(i);end
       if(i-j==0);D=x0;else;D=x(i-j);end
       a(i) = (A - B)/(C - D);
    end
end
s = "";
for i = n:-1:1
   s = s + "(" + num2str(a(i)) + ")" + "*u^" + "(" + num2str(i) + ")" + " + "; 
end
s = s + num2str(a0);
pl = str2sym(s);
disp("The polynomial is");
disp(pl);
for t = -5:0.25:5
    temp = a(n);
    for i = n-1:-1:0
        if(i==0);A=x0;else;A=x(i);end
        if(i==0);B=a0;else;B=a(i);end
        temp = temp*(t - A) + B;
    end
    ac = f(t);
    diff = abs(ac - temp);
    disp("At t = " + num2str(t) + " the actual value is " + num2str(ac));
    disp("At t = " + num2str(t) + " the polynomial value is " + num2str(temp));
    disp("At t = " + num2str(t) + " the difference between the actual value and the polynomial value is " + num2str(diff));
end
    