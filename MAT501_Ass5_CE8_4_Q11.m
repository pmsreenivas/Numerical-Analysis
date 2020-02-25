ch = 0;
while(ch ~= 1 && ch ~= 2)
    ch = input("Enter 1 for Jacobi or 2 for Gauss Seidel: ");
    if(ch ~= 1 && ch ~= 2)
        disp("Wrong choice, Enter again");
    end
end
%--------
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
x = zeros(n,100);
%--------
iv = input("Enter initial values of x as vector with " + num2str(n) + " rows: ");
k = 0;
if(ch == 1)
  %Jacobi
  while(1)
      for i = 1:n
          sum = 0;
          for j = 1:n
              if (j ~= i)
                  if(k > 0)
                      sum = sum + A(i,j) * x(j,k);
                  else
                      sum = sum + A(i,j) * iv(j);
                  end
              end
          end
          x(i,k + 1) = (b(i) - sum)/A(i,i);
      end
      k = k + 1;
      disp("The values of x at the end of the " + num2str(k) + "th iteration is as follows");
      disp(x(:,k));
      ch2 = 0;
      while(ch2 ~= 1 && ch2 ~= 2)
          ch2 = input("Enter 1 to proceed to next iteration or 2 to quit: ");
          if(ch2 ~= 1 && ch2 ~= 2)
              disp("Wrong choice, Enter again");
          end
      end
      if(ch2 == 2)
          break;
      end
  end
else
    %Gauss Seidel
 while(1)
      for i = 1:n
          sum = 0;
          for j = 1:n
              if (j ~= i)
                  if(k > 0)
                      if(j < i)
                          sum = sum + A(i,j) * x(j,k + 1);
                      else
                          sum = sum + A(i,j) * x(j,k);
                      end
                  else
                      if(j < i)
                          sum = sum + A(i,j) * x(j,k + 1);
                      else
                          sum = sum + A(i,j) * iv(j);
                      end
                  end
              end
          end
          x(i,k + 1) = (b(i) - sum)/A(i,i);
      end
      %-------
      k = k + 1;
      disp("The values of x at the end of the " + num2str(k) + "th iteration is as follows");
      disp(x(:,k));
      ch2 = 0;
      while(ch2 ~= 1 && ch2 ~= 2)
          ch2 = input("Enter 1 to proceed to next iteration or 2 to quit: ");
          if(ch2 ~= 1 && ch2 ~= 2)
              disp("Wrong choice, Enter again");
          end
      end
      if(ch2 == 2)
          break;
      end
  end
end