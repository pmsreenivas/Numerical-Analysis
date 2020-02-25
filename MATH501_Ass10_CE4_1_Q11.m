syms u;
n = 5;
x0 = 0;
x = [1, 2, 3, 4, 5];
y0 = 0;
y = [1, 2.001, 3, 4, 5];
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
for t = 14:6:20
    temp = a(n);
    for i = n-1:-1:0
        if(i==0);A=x0;else;A=x(i);end
        if(i==0);B=a0;else;B=a(i);end
        temp = temp*(t - A) + B;
    end
    ac = t;
    diff = abs(ac - temp);
    disp("At t = " + num2str(t) + " the difference between the actual value and the polynomial value is " + num2str(diff));
end
    