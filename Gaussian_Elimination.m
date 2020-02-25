A = input("Enter a square nonsingular matrix - the coefficient matrix - n by n: ");
b = input("Enter the right hand sides as a matrix - n by m - m right hand sides: ");
cho = input("Enter 1 for no pivoting or 2 for partial pivoting or 3 for scaled partial pivoting: ");
n = length(A);
m = length(b(1,:));
i = 0; j = 0; k = 0; sum = 0; xmult = 0; smax = 0; r = 0; rmax = 0;
l = zeros(1,n);
s = zeros(1,n);
x = zeros(n,m);
switch(cho)
    case 1
        for k = 1:(n - 1)
            for i = (k + 1):n
                xmult = A(i,k)/A(k,k);
                A(i,k) = 0;
                for j = (k + 1):n
                    A(i,j) = A(i,j) - xmult * A(k,j);
                end
                for j = 1:m
                    b(i,j) = b(i,j) - xmult * b(k,j);
                end
            end
        end
        for j = 1:m
            x(n,j) = b(n,j)/A(n,n);
        end
        for k = 1:m
            for i = (n - 1):-1:1
                sum = b(i,k);
                for j = (i + 1):n
                    sum = sum - A(i,j) * x(j,k);
                end
                x(i,k) = sum/A(i,i);
            end
        end
        
    case 2           
        for i = 1:n
            l(i) = i;
        end
        for k = 1:(n-1)
            rmax = 0;
            for i = k:n
                r = abs(A(l(i),k));
                if(r > rmax)
                    rmax = r;
                    j = i;
                end
            end
            temp = l(j);
            l(j) = l(i);
            l(i) = temp;
            for i = (k + 1):n
                xmult = A(l(i),k)/A(l(k),k);
                A(l(i),k) = xmult;
                for j = (k + 1):n
                    A(l(i),j) = A(l(i),j) - xmult * A(l(k),j);
                end
            end
        end
        for j = 1:m
            for k = 1:(n - 1)
                for i =(k + 1):n
                    b(l(i),j) = b(l(i),j) - A(l(i),k) * b(l(k),j);
                end
            end
        end
        for j =1:m
            x(n,j) = b(l(n),j)/A(l(n),n);
        end
        for k = 1:m
            for i = (n - 1):-1:1
                sum = b(l(i),k);
                for j = (i + 1):n
                    sum = sum - A(l(i),j) * x(j,k);
                end
                x(i,k) = sum/A(l(i),i);
            end
        end
      
    case 3
        for i = 1:n
            l(i) = i;
            smax = 0;
            for j = 1:n
                smax = max(smax,abs(A(i,j)));
            end
            s(i) = smax;
        end
        for k = 1:(n-1)
            rmax = 0;
            for i = k:n
                r = abs(A(l(i),k)/s(l(i)));
                if(r > rmax)
                    rmax = r;
                    j = i;
                end
            end
            temp = l(j);
            l(j) = l(i);
            l(i) = temp;
            for i = (k + 1):n
                xmult = A(l(i),k)/A(l(k),k);
                A(l(i),k) = xmult;
                for j = (k + 1):n
                    A(l(i),j) = A(l(i),j) - xmult * A(l(k),j);
                end
            end
        end
        for j = 1:m
            for k = 1:(n - 1)
                for i =(k + 1):n
                    b(l(i),j) = b(l(i),j) - A(l(i),k) * b(l(k),j);
                end
            end
        end
        for j =1:m
            x(n,j) = b(l(n),j)/A(l(n),n);
        end
        for k = 1:m
            for i = (n - 1):-1:1
                sum = b(l(i),k);
                for j = (i + 1):n
                    sum = sum - A(l(i),j) * x(j,k);
                end
                x(i,k) = sum/A(l(i),i);
            end
        end
end
disp("Each column corresponds to the solution vector pertaining to one right hand side")
disp(x)