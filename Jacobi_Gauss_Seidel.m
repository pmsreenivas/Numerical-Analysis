ch = 0;
while(ch ~= 1 && ch ~= 2)
    ch = input("Enter 1 for Jacobi or 2 for Gauss Seidel: ");
    if(ch ~= 1 && ch ~= 2)
        disp("Wrong choice, Enter again");
    end
end
A = input("Enter a square matrix (the coefficient matrix): ");
n = length(A);
b = input("Enter an RHS vector with " + num2str(n) + " rows: ");
x = zeros(n,100);
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