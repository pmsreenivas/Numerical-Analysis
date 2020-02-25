A = input("Enter a 4 by 4 tridiagonal matrix: ");
L = zeros(4);
U = zeros(4);
U(1,1) = A(1,1);
for i = 2:4
    U(i-1,i) = A(i-1,i);
    L(i,i-1) = A(i,i-1)/U(i-1,i-1);
    U(i,i) = A(i,i) - L(i,i-1) * U(i-1,i);
end
for i = 1:4
    L(i,i) = 1;
end
disp("L");
disp(L);
disp("U");
disp(U);
M = L*U;
N = M - A;
P = zeros(4);
for i = 1:4
    for j = 1:4
        if(abs(N(i,j)) < 10^-10)
            P(i,j) = 1;
        end
    end
end
if(P)
    disp("A = LU is true");
else
    disp("A = LU is false");
end