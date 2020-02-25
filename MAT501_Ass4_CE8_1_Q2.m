A = input("Enter a square matrix: ");
n = length(A);
computed = 0;
while(1)
    ch = input("Enter '1' for l(1,1) or '2' for u(1,1): ");
    if(ch == 1)
        L(1,1) = input("Enter the value of l(1,1): ");
        U(1,1) = A(1,1)/L(1,1);
        break;
    elseif(ch == 2)
        U(1,1) = input("Enter the value of u(1,1): ");
        L(1,1) = A(1,1)/U(1,1);
        break;
    else
        disp("Wrong choice, choose again");
        continue;
    end
end
for i = 1:n
    L(i,1) = A(i,1)/U(1,1);
    U(1,i) = A(1,i)/L(1,1);
end
computed = computed + 1;
while(computed < n)
    k = computed + 1;
    while(1)
        ch = input("Enter '1' for l(" + num2str(k) + "," + num2str(k) + ") or '2' for u("  + num2str(k) + "," + num2str(k) + "): ");
        if(ch == 1)
            L(k,k) = input("Enter the value of l(" + num2str(k) + "," + num2str(k) + "): ");
            sum = 0;
            for m = 1:k - 1
                sum = sum + L(k,m) * U(m,k);
            end
            U(k,k) = (A(k,k) - sum)/L(k,k);
            for i = k:n
                sum = 0;
                for m = 1:k - 1
                    sum = sum + L(i,m) * U(m,k);
                end
                L(i,k) = (A(i,k) - sum)/U(k,k);
            end
            for i = k:n
                sum = 0;
                for m = 1:k - 1
                    sum = sum + L(k,m) * U(m,i);
                end
                U(k,i) = (A(k,i) - sum)/L(k,k);
            end
            computed = computed + 1;
            break;
        elseif(ch == 2)
            U(k,k) = input("Enter the value of u(" + num2str(k) + "," + num2str(k) + "): ");
            sum = 0;
            for m = 1:k - 1
                sum = sum + L(k,m) * U(m,k);
            end
            L(k,k) = (A(k,k) - sum)/U(k,k);
            for i = k:n
                sum = 0;
                for m = 1:k - 1
                    sum = sum + L(i,m) * U(m,k);
                end
                L(i,k) = (A(i,k) - sum)/U(k,k);
            end
            for i = k:n
                sum = 0;
                for m = 1:k - 1
                    sum = sum + L(k,m) * U(m,i);
                end
                U(k,i) = (A(k,i) - sum)/L(k,k);
            end
            computed = computed + 1;
            break;
        else
            disp("Wrong choice, choose again");
            continue;
        end
    end
end
disp("L is ");
disp(L);
disp("U is ");
disp(U);
disp("A is ");
disp(A);
disp("LU is ");
M = L*U;
disp(M);
