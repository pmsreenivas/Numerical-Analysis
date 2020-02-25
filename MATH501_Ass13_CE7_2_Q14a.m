f = @(t,x) exp(t) - 1;
g = @(t) exp(t) - 1 - t;
xt = 0;
Axt = 0;
h = 2^-7;
for pt = h:h:1
    k1 = h*feval(f,pt,xt);
    k2 = h*feval(f,(pt + 0.5*h),(xt + 0.5*k1));
    k3 = h*feval(f,(pt + 0.5*h),(xt + 0.5*k2));
    k4 = h*feval(f,(pt + h),(xt + k3));
    xt = xt + (k1 + 2*k2 + 2*k3 + k4)/6;
    Ak1 = h*feval(f,pt,Axt);
    Ak2 = h*feval(f,(pt + 0.5*h),(Axt + 0.5*k1));
    Ak3 = h*feval(f,(pt + 0.5*h),(Axt + 0.25*Ak1 + 0.25*Ak2));
    Ak4 = h*feval(f,(pt + h),(Axt - Ak2 + 2*Ak3));
    Axt = Axt + (Ak1 + 4*Ak3 + Ak4)/6;
    av = feval(g,pt);
    disp("The  numerically calculated value at " + num2str(pt) + " by the classical method is " + num2str(xt));
    disp("The  numerically calculated value at " + num2str(pt) + " by the alternate method is " + num2str(Axt));
    disp("The actual value at " + num2str(pt) + " is " + num2str(av));
    EC = abs(av - xt);
    EA = abs(av - Axt);
    R = EC/EA;
    disp("The error of the classical method at " + num2str(pt) + " is " + num2str(EC));
    disp("The error of the alternate method at " + num2str(pt) + " is " + num2str(EA));
    disp("The ratio of the errors at " + num2str(pt) + " is " + num2str(R));
end