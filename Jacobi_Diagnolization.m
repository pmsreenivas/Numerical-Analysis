T0 = input("Enter a real, symmetric, non defective matrix:- ");
E = input("Enter a tolerance value:- ");
n = length(T0);
T = zeros(n,n,10000);
V = zeros(1,10000);
S = zeros(n,n,10000);
th = zeros(1,10000);
V0 = 0;
for i = 1:n
    for j = 1:n
        if i ~= j
            V0 = V0 + (abs(T0(i,j)))^2; 
        end
    end
end
k = 1;
V(1) = V0;
T(:,:,1) = T0;
while (V(k) > E)
    k = k + 1;
    p = 0;
    q = 0;
    max = 0;
    for i = 1:n
        for j = 1:n
         if abs(T(i,j,k - 1)) > abs(max) && i ~= j
             p = i;
             q = j;
             max = T(i,j,k-1);
         end
        end
    end
    th(k) = 0.5 * acot(((T(q,q,k-1) - T(p,p,k-1))/(2 * T(p,q,k-1))));
    for i = 1:n
        S(i,i,k) = 1;
    end
    S(p,p,k) = cos(th(k));
    S(q,q,k) = cos(th(k));
    S(p,q,k) = sin(th(k));
    S(q,p,k) = -sin(th(k));
    T(:,:,k) = transpose(S(:,:,k)) * T(:,:,k-1) * S(:,:,k);
    for i = 1:n
        for j = 1:n
            if i ~= j
                V(k) = V(k) + (abs(T(i,j,k)))^2; 
            end
        end
    end
end
D = T(:,:,k);
evs = diag(D);
evs = evs' ;
disp("The final diagnolised matrix is ");
disp(D);
disp("The eigen values are ");
disp(evs);
% EV = zeros(n);
% for i = 1:n
%     EV(:,i) = null(T0 - evs(i) * eye(n));
% end
% disp("The eigen vectors are ");
% disp(EV);