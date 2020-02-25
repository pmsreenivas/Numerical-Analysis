format long
A = input("Enter a square matrix:- ");
n = length(A);
x0 = input("Enter x0 (initial values) as a column vector:- "); 
ch = 0;
while(ch ~= 1 && ch ~= 2 && ch ~= 3 && ch ~= 4)
    ch = input("Enter a choice: " + newline + "1. Power Method" + newline + "2. Inverse Power Method" + newline + "3. Shifted Power Method" + newline + "4. Shifted Inverse Power Method" + newline);
    if(ch ~= 1 && ch ~= 2 && ch ~= 3 && ch ~= 4)
        disp("Wrong choice, Please Re-Enter")
    end
end
ch2 = 0;
while(ch2 ~= 1 && ch2 ~= 2)
    ch2 = input("Do you want Aitken acceleration? - 1. Yes 2. No :- ");
    if(ch2 ~= 1 && ch2 ~= 2)
        disp("Wrong choice, Please Re-Enter")
    end
end
if(ch == 3 || ch == 4)
    mu = input("Enter shift value:- ");
end
switch(ch)
    case 1
        B = A;
    case 2
        B = inv(A);
    case 3
        B = A - mu * eye(n);
    case 4
        B = inv(A - mu * eye(n));       
end
itr = 0;
x = zeros(n,1000);
y = zeros(n,1000);
r = zeros(1,1000);
s = zeros(1,1000);
ch3 = 0;
while(ch3 ~= 2)
  ch3 = 0;
  itr = itr + 1;
  if(itr == 1)
      y(:,itr) = B * x0;
      r(itr) = transpose(y(:,itr)) * x0;
  else
      y(:,itr) = B * x(:,itr - 1);
      r(itr) = transpose(y(:,itr)) * x(:,itr - 1);
  end
  if(itr >= 3)
      s(itr) = r(itr) - (r(itr) - r(itr - 1))^2/(r(itr) - 2 * r(itr - 1) + r(itr - 2));
  end
  x(:,itr) = y(:,itr)/sqrt(transpose(y(:,itr)) * y(:,itr));
  disp("The values of the " + num2str(itr) + "th iteration is as follows:-");
  disp("x =");
  disp(x(:,itr));
  disp("r =");
  disp(r(itr));
  if(ch2 == 1 && itr >= 3)
    disp("s =");
    disp(s(itr));
  end
  while(ch3 ~= 1 && ch3 ~= 2)
    ch3 = input("Choose any one - 1. Next Iteration 2. I'm done :- ");
    if(ch3 ~= 1 && ch3 ~= 2)
        disp("Wrong choice, Please Re-Enter")
    end
  end
end
lambda = 0;
if(ch2 == 1)
    tlambda = s(itr);
else
    tlambda = r(itr);
end
switch(ch)
    case 1
       lambda = tlambda;
    case 2
        lambda = 1/tlambda;
        disp("The eigen value of the inverse is:- ");
        disp(tlambda);  
    case 3
        lambda = tlambda + mu;
        disp("The eigen value of the shifted matrix is:- ");
        disp(tlambda);  
    case 4
        lambda = 1/tlambda + mu;
        disp("The eigen value of the inverse of the shifted matrix is:- ");
        disp(tlambda);       
end
disp("The Required eigen value of the matrix is:- ");
disp(lambda);
E = null(A - lambda * eye(n));
disp("The corresponding eigen vector obtained as the orthonormal null space of 'A - lambda*I' is: " );
disp(E);