function [Answer] = objfun2(x)
n=length(x);
f=0;
for i = 1:n
    for  j = 1:i
      f= f+(x(j)- j)^2;
    end
end
Answer = f;
