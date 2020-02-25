f = @(t,x) exp(t) - 1;
g = @(t) exp(t) - 1 - t;
xtmh = 0;
xt = 0;
h = 2^-7;
for pt = h:h:1
    xttph = xt + 0.5*h*(3*feval(f,pt,xt) - feval(f,(pt - h),xtmh));
    xtph = xt + 0.5*h*(feval(f,(pt + h),xttph) + feval(f,pt,xt));
    av = feval(g,(pt + h));
    disp("The  numerically calculated value at " + num2str(pt + h) + " is " + num2str(xtph));
    disp("The actual value at " + num2str(pt + h) + " is " + num2str(av));
    E = (1/6)*(xtph - xttph);
    disp("The single step error is " + num2str(E));
    xtmh = xt;
    xt = xtph; 
end