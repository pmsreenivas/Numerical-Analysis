syms x u v
format long
clear
str = input('Give a polynomial in x: ','s');
f = str2sym(str);
pcs = coeffs(f, 'All');
pcs = fliplr(pcs);
n = length(pcs);
n = n - 1;
times = ceil(n/2) - 1;
FR = zeros(1,2);
Q = zeros(1,3,floor(n/2));
qcs = pcs;
qcs = double(qcs);
%do Bairstow's method times times
for i = 1:times
   for j = 1:(length(qcs))
       b(j) = "abcd";
   end
   b(1) = num2str(qcs(1));
   b(2) = num2str(qcs(2)) + "+ u*" + b(1);
   for j = 3:length(qcs)
       b(j) = num2str(qcs(j)) + "+ u*(" + b(j - 1) + ") + v*(" + b(j - 2) + ")";
   end
   bx = str2sym(b);
   bn = bx(length(qcs));
   bnm1 = bx(length(qcs) - 1);
   F = zeros(2,1,100);
   J = zeros(2,2,100);
   H = zeros(2,1,100);
   X = zeros(2,1,100);
   u0 = 0;
   v0 = 0;
   syms x u v
   J11 = diff(bnm1,u);
   J12 = diff(bnm1,v);
   J21 = diff(bn,u);
   J22 = diff(bn,v);
   uval = 0;
   vval = 0;
   for j = 1:100
       if j == 1
           X(1,1,1) = u0;
           X(2,1,1) = v0;
       else
            X(:,:,j) = X(:,:,j - 1) + H(:,:,j-1);
       end
       uval = X(1,1,j);
       vval = X(2,1,j);
       F(1,1,j) = eval(subs(subs(bnm1,u,uval),v,vval));
       F(2,1,j) = eval(subs(subs(bn,u,uval),v,vval));
       J(1,1,j) = eval(subs(subs(J11,u,uval),v,vval));
       J(1,2,j) = eval(subs(subs(J12,u,uval),v,vval));
       J(2,1,j) = eval(subs(subs(J21,u,uval),v,vval));
       J(2,2,j) = eval(subs(subs(J22,u,uval),v,vval));
       H(:,:,j) = -inv(J(:,:,j))*F(:,:,j);
   end % u & v have been found
   Q(:,:,i) = [-vval -uval 1];
   nr = fliplr(qcs);
   dr = fliplr(Q(:,:,i));
   [qcs,r] = deconv(nr,dr);
   qcs = fliplr(qcs);
   if i == times
      if mod(n,2) == 0
          Q(:,:,i + 1) = fliplr(r);
      else
          FR = fliplr(r);
      end
   end
end
rts = zeros(1,n);
for i = 1:floor(n/2)
    cc = Q(1,1,i);
    bb = Q(1,2,i);
    aa = Q(1,3,i);
    rts(2*i - 1) = (-bb + sqrt(bb^2 - 4*aa*cc))/(2*aa);
    rts(2*i) = (-bb - sqrt(bb^2 - 4*aa*cc))/(2*aa);
end
if mod(n,2) == 1
    bb = FR(1);
    aa = FR(2);
    rts(length(rts)) = -bb/aa;
end
disp("The roots are: ");
disp(rts);