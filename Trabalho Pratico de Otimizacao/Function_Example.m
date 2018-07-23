function [f,x] = Function_Example(x)
f = 2*x(1)^2+ x(2)^2+ 2*x(1)*x(2)+x(1)-2*x(2)+3;
-6<=x(1)<=6;
-6<=x(2)<=6;
end