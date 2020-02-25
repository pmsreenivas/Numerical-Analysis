clc
clear
format long
v = 0;
syms x y z;
while(v ~= 2 && v ~= 3)
    v = input('Enter the number of variables - enter 2 or 3: ');             
    if(v ~= 2 && v ~= 3)                                                     
        disp('Wrong choice, please re enter');
    end
end
n = input('Enter the number of steps: ');
F = zeros(v,1,n + 1);
J = zeros(v,v,n + 1);
H = zeros(v,1,n + 1);
X = zeros(v,1,n + 1);

switch(v)
    
    case 2
        str = input('Give the 1st equation in x & y: ','s');
        f1 = str2sym(str);
        str = input('Give the 2nd equation in x & y: ','s');
        f2 = str2sym(str);
        x0 = input('Enter the initial value of x: ');
        y0 = input('Enter the initial value of y: ');
        J11 = diff(f1,x);
        J12 = diff(f1,y);
        J21 = diff(f2,x);
        J22 = diff(f2,y);
        xval = 0;
        yval = 0;
        for i = 1:n+1
            if i == 1
                X(1,1,1) = x0;
                X(2,1,1) = y0;
            else
                X(:,:,i) = X(:,:,i - 1) + H(:,:,i-1);
            end
            xval = X(1,1,i);
            yval = X(2,1,i);
            F(1,1,i) = eval(subs(subs(f1,x,xval),y,yval));
            F(2,1,i) = eval(subs(subs(f2,x,xval),y,yval));
            J(1,1,i) = eval(subs(subs(J11,x,xval),y,yval));
            J(1,2,i) = eval(subs(subs(J12,x,xval),y,yval));
            J(2,1,i) = eval(subs(subs(J21,x,xval),y,yval));
            J(2,2,i) = eval(subs(subs(J22,x,xval),y,yval));
            H(:,:,i) = -inv(J(:,:,i))*F(:,:,i);
        end
        disp('The required roots are: '); 
        disp('x = ');
        disp(xval);
        disp('y = ');
        disp(yval);
    case 3
        str = input('Give the 1st equation in x, y & z : ','s');
        f1 = str2sym(str);
        str = input('Give the 2nd equation in x, y & z: ','s');
        f2 = str2sym(str);
        str = input('Give the 3rd equation in x, y & z: ','s');
        f3 = str2sym(str);        
        x0 = input('Enter the initial value of x: ');
        y0 = input('Enter the initial value of y: ');
        z0 = input('Enter the initial value of z: ');
        J11 = diff(f1,x);
        J12 = diff(f1,y);
        J13 = diff(f1,z);
        J21 = diff(f2,x);
        J22 = diff(f2,y);
        J23 = diff(f2,z);
        J31 = diff(f3,x);
        J32 = diff(f3,y);
        J33 = diff(f3,z);
        xval = 0;
        yval = 0;
        zval = 0;
        for i = 1:n+1
            if i == 1
                X(1,1,1) = x0;
                X(2,1,1) = y0;
                X(3,1,1) = z0;
            else
                X(:,:,i) = X(:,:,i - 1) + H(:,:,i-1);
            end
            xval = X(1,1,i);
            yval = X(2,1,i);
            zval = X(3,1,i);
            F(1,1,i) = eval(subs(subs(subs(f1,x,xval),y,yval),z,zval));
            F(2,1,i) = eval(subs(subs(subs(f2,x,xval),y,yval),z,zval));
            F(3,1,i) = eval(subs(subs(subs(f3,x,xval),y,yval),z,zval));
            J(1,1,i) = eval(subs(subs(subs(J11,x,xval),y,yval),z,zval));
            J(2,1,i) = eval(subs(subs(subs(J21,x,xval),y,yval),z,zval));
            J(3,1,i) = eval(subs(subs(subs(J31,x,xval),y,yval),z,zval));
            J(1,2,i) = eval(subs(subs(subs(J12,x,xval),y,yval),z,zval));
            J(2,2,i) = eval(subs(subs(subs(J22,x,xval),y,yval),z,zval));
            J(3,2,i) = eval(subs(subs(subs(J32,x,xval),y,yval),z,zval));
            J(1,3,i) = eval(subs(subs(subs(J13,x,xval),y,yval),z,zval));
            J(2,3,i) = eval(subs(subs(subs(J23,x,xval),y,yval),z,zval));
            J(3,3,i) = eval(subs(subs(subs(J33,x,xval),y,yval),z,zval));
            H(:,:,i) = -inv(J(:,:,i))*F(:,:,i);
        end
        disp('The required roots are: '); 
        disp('x = ');
        disp(xval);
        disp('y = ');
        disp(yval);
        disp('z = ');
        disp(zval);
end
