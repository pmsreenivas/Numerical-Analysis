n = 0;
while(n == 0)
    xx = input("Enter the values of x as a row vector: ");
    y = input("Enter the values of f(x) as a row vector: ");
    n = length(xx);
    m = length(y);
    if(n ~= m)
        n = 0;
        disp("Enter same number of x's and f(x)'s");
    end
end
syms x;
for i = 1:n
    strry(i) = "";
end
for i = 1:n
    for j = 1:n
        if i ~= j
            strry(i) = strry(i) + "(x-" + num2str(xx(j)) + ")*" ;
        end
    end
    strry(i) = strry(i) + "1";
    p = str2sym(strry(i));
    Dr = eval(subs(p,xx(i)));
    strry(i) = strry(i) + "*";
    strry(i) = strry(i) + "(1/" + num2str(Dr) + ")*(" + num2str(y(i)) + ")";
end
str = "";
for i = 1:n
    str = str + strry(i) + " + ";
end
str = str + "0";
q = str2sym(str);
disp("The polynomial is");
disp(q);
t = input("Enter a value for evaluation: ");
an = eval(subs(q,t));
disp("The answer is " + num2str(an));