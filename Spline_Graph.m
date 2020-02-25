syms x;
t = input("Enter the interpolation points as a row vector: ");
ch = 0;
while(ch ~= 1 && ch ~= 2)
    ch = input("Choose any one -" + newline +  " 1. I want to enter a function to compute the ys" + newline + "2. I want to enter the ys myself" + newline);
    if(ch ~= 1 && ch ~= 2)
        disp("Wrong choice, please re enter");
    end
end
if(ch == 1)
    n = length(t) - 1;
    t0 = t(1);
    t = t(2:length(t));
    str = input("Enter a function in x: ",'s');
    f = str2sym(str);
    y0 = eval(subs(f,t0));
    tvr = 0;
    for i = 1:n
        tvr = t(i);
        y(i) =  eval(subs(f,tvr));
    end
else
    while(1)
        y = input("Enter the ys as a row vector: ");
        if(length(t) ~= length(y))
            disp("You have entered the wrong number of points, please re enter");
        else
            break;
        end
    end
    n = length(t) - 1;
    t0 = t(1);
    t = t(2:length(t));
    y0 = y(1);
    y = y(2:length(y));
end
h0 = t(1) - t0;
for i = 1:n - 1
    h(i) = t(i + 1) - t(i);
end
b0 = (y(1) - y0)/h0;
for i = 1:n - 1
    b(i) = (y(i + 1) - y(i))/h(i);
end
u(1) = 2*(h0 + h(1));
v(1) = 6*(b(1) - b0);
for i = 2:n - 1
    u(i) = 2*(h(i) + h(i-1)) - (h(i-1)^2)/u(i-1);
    v(i) = 6*(b(i) - b(i-1)) - (h(i-1)*v(i-1))/u(i-1);
end
z0 = 0;
z = zeros(1,n);
z(n) = 0;
for i = (n-1):-1:1
    z(i) = (v(i) - h(i)*z(i+1))/u(i);
end
A0 = z(1)/(6*h0);
B0 = 0;
C0 = (y(1)/h0 - (h0*z(1))/6);
D0 = y0/h0;
for i = 1:n-1
    A(i) = z(i + 1)/(6*h(i));
    B(i) = z(i)/(6*h(i));
    C(i) = (y(i+1)/h(i) - (h(i)*z(i+1))/6);
    D(i) = (y(i)/h(i) - (h(i)*z(i))/6);
end
S0 = num2str(A0) + "*(x -(" + num2str(t0) + "))^3 + " + num2str(C0) + "*(x -(" + num2str(t0) + ")) -( " + num2str(D0) + ")*(x - " + num2str(t(1)) + ")";
for i = 1:n-1
    S(i) = num2str(A(i)) + "*(x - (" + num2str(t(i)) + "))^3 - (" + num2str(B(i)) + ")*(x -(" + num2str(t(i+1)) + "))^3 +" + num2str(C(i)) + "*(x -(" + num2str(t(i)) + ")) - (" + num2str(D(i)) + ")*(x - (" + num2str(t(i+1)) + "))";
end
s0 = str2sym(S0);
s = str2sym(S);
if(ch == 1)
    fplot(f,[t0,t(n)]);
    hold on;
end
for i = 0:n-1
    if(i == 0)
        fplot(s0,[t0,t(1)]);
    else
        fplot(s(i),[t(i),t(i+1)]);
    end
    hold on;
end
legend('show','Location','best')