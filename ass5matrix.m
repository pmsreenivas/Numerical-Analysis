n = 2;
while(mod(n,2) == 0 || n == 1) 
    n = input("Enter the number of rows - any odd number greater than 2: ");
    if(mod(n,2) == 0 || n == 1)
       disp("Incompatible value of n, please re enter"); 
    end
end
A = zeros(n);
for i = 1:n
    A(i, n + 1 - i) = 0.5;
    A(i,i) = 3;
    if(i - 1 > 0)
        A(i,i - 1) = -1;
        A(i - 1,i) = -1;
    end
end
b = zeros(n,1);
for i = 1:n
    b(i) = 1.5;
end
b(1) = 2.5;
b(n) = 2.5;
if mod(n,2) == 1
    b(ceil(n/2)) = 1;
end
disp("A is ");
disp(A);
disp("b is ");
disp(b);

