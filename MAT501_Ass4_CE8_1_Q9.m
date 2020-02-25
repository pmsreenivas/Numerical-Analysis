A = input("Enter a square, positive, definite and symmetric matrix: ");
n = length(A);
L = zeros(n);
for k = 1:n
    sum = 0;
    for s = 1:k-1
        sum = sum + L(k,s) * L(k,s);
    end
    L(k,k) = sqrt(A(k,k) - sum);
    for i = k + 1:n
        sum = 0;
        for s = 1:k-1
            sum = sum + L(i,s) * L(k,s);
        end
        L(i,k) = (A(i,k) - sum)/L(k,k);
    end
end
U = transpose(L);
disp("L is ");
disp(L);
disp("transpose(L) is ");
disp(U);
disp("A is ");
disp(A);
disp("L*transpose(L) is ");
disp(L*U);