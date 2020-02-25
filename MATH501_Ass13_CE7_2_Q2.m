f = @(t,x) x/t + t*sec(x/t);
g = @(t) t*asin(t);
xt = 0;
h = 2^-7;
for pt = h:h:1
    if (pt == 0)
        k1 = 0;
    else
        k1 = h*feval(f,pt,xt);
    end
    k2 = h*feval(f,(pt + 0.5*h),(xt + 0.5*k1));
    k3 = h*feval(f,(pt + 0.5*h),(xt + 0.5*k2));
    k4 = h*feval(f,(pt + h),(xt + k3));
    xt = xt + (k1 + 2*k2 + 2*k3 + k4)/6;
    av = feval(g,pt);
    disp("The  numerically calculated value at " + num2str(pt) + " is " + num2str(xt));
    disp("The actual value at " + num2str(pt) + " is " + num2str(av));
end