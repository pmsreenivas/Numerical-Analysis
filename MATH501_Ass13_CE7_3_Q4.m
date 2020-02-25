f = @(t,x) exp(t) - 1;
g = @(t) exp(t) - 1 - t;
h = 2^-7;
xt = feval(g,0);
xtmh = feval(g,-h);
xtm2h = feval(g,-2*h);
xtm3h = feval(g,-3*h);
for pt = 0:h:1
    xttph = xt + (h/24)*(55*feval(f,pt,xt) - 59*feval(f,(pt - h),xtmh) + 37*feval(f,(pt - 2*h),xtm2h) - 9*feval(f,(pt - 3*h),xtm3h));
    xtph = xt + (h/24)*(9*feval(f,(pt + h),xttph) + 19*feval(f,pt,xt) - 5*feval(f,(pt - h),xtmh) + feval(f,(pt - 2*h),xtm2h));
    av = feval(g,(pt + h));
    disp("The  numerically calculated value at " + num2str(pt + h) + " is " + num2str(xtph));
    disp("The actual value at " + num2str(pt + h) + " is " + num2str(av));
    xtm3h = xtm2h;
    xtm2h = xtmh;
    xtmh = xt;
    xt = xtph; 
end