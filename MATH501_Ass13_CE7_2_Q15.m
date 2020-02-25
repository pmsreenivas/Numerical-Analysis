f = @(t,x) exp(t) - 1;
g = @(t) exp(t) - 1 - t;
xt = 0;
h = 2^-7;
for pt = h:h:1
    k1 = h*feval(f,pt,xt);
    k2 = h*feval(f,(pt + 0.5*h),(xt + 0.5*k1));
    k3 = h*feval(f,(pt + 0.5*h),(xt + 0.25*k1 + 0.25*k2));
    k4 = h*feval(f,(pt + h),(xt - k2 + 2*k3));
    k5 = h*feval(f,(pt + (2/3)*h),(xt + (7/27)*k1 + (10/27)*k2 + (1/27)*k4));
    k6 = h*feval(f,(pt + (1/5)*h),(xt + (28/625)*k1 - (1/5)*k2 + (546/625)*k3 + (54/625)*k4 - (378/625)*k5));
    xt = xt + (1/24)*k1 + (5/48)*k4 + (27/56)*k5 + (125/336)*k6;
    av = feval(g,pt);
    disp("The  numerically calculated value at " + num2str(pt) + " is " + num2str(xt));
    disp("The actual value at " + num2str(pt) + " is " + num2str(av));
end