function [F, h, g] = funBarrier(x)

global Rh Rg;

%x = x(:);
h = [];
g = [];

% Function and Constrains
f = (x(1)-5).^2 -(x(2)-3).^2;
g(1) = x(1) + x(2) - 3;
g(2) = -x(1) + 2*x(2) - 4;
g(3) = 3 - x(1);
g(4) = x(1) - 5;
g(5) = 3 - x(2);
g(6) = x(2) - 5;
h(1) =0 ;

% Penalty Function
 p = -Rg * ((1/sum(max(0,g))));

% Modified Function
F = f + p;

