n = input("Enter the value of n - 2 <= n <= 15: ");
A = zeros(n);
b = zeros(n,1);
i = 0; j = 0;
for i = 1:n
    for j = 1:n
        A(i,j) = 1/(i + j - 1);
    end
end
disp("The Hilbert matrix of order " +num2str(n) + " is ");
disp(A);
for i = 1:n
    for j = 1:n
        b(i) = b(i) + A(i,j);
    end
end
disp("The right hand side vector of order " +num2str(n) + " is ");
disp(b);
n = length(A);
i = 0; j = 0; k = 0; sum = 0; xmult = 0; smax = 0; r = 0; rmax = 0;
l = zeros(1,n);
s = zeros(1,n);
x = zeros(n,1);
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
            for k = 1:(n - 1)
                for i =(k + 1):n
                    b(l(i)) = b(l(i)) - A(l(i),k) * b(l(k));
                end
            end       
            x(n) = b(l(n))/A(l(n),n);      
            for i = (n - 1):-1:1
                sum = b(l(i));
                for j = (i + 1):n
                    sum = sum - A(l(i),j) * x(j);
                end
                x(i) = sum/A(l(i),i);
            end
disp("The solution is")
disp(x)