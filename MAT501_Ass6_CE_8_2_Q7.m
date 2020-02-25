A = input("Enter a square matrix: ");
syms x;
B = A;
%B = sym(A);
polyA = charpoly(B,x);
polyB = charpoly(B);
disp("The characteristic polynomial of the matrix is");
disp(polyA);
eigenA = roots(polyB);
disp("After solving the characteristic polynomial of the matrix, we get the eigen values as follows");
disp(eigenA);
n = length(A);
C = zeros(n);
for i = 1:n
    D = A - eigenA(i)*eye(n);
    E = null(D);
    disp("The " + num2str(i) + "th eigen value is "); 
    disp(eigenA(i));
    disp("The corresponding eigen vector obtained as the orthonormal null space of 'A - lambda*I' is: " );
    disp(E);
end
e = eig(A);
disp("The eigen values directly calculated are as follows");
disp(e);
[V,DD] = eig(A);
disp("The orthonormal eigen vectors directly calculated are as follows");
disp(V);