while(1)
    a = input("Enter the beginning of the interval:- ");
    b = input("Enter the end of the interval:- ");
    str = input('Give an equation in x: ','s')  ;
    f = inline(str,'x') ;
    fa = feval(f,a);
    fb = feval(f,b);
    if a > b
        disp("The beginning must be lesser than the end. Please re enter");
    elseif fa * fb > 0
        disp("The interval values yield the same sign with the function. Please re enter");
    else
        break;
    end
end
n = input("Enter steps:- ");
while(n)
    c = (a + b)/2;
    fc = feval(f,c);
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end 
    disp("n =");
    disp(n);
    disp("a =");
    disp(a);
    disp("b =");
    disp(b);
    disp("c =");
    disp(c);
    n = n - 1;
end
disp("The approximate root is " + num2str(c));
        
   