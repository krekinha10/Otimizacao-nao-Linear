function [F, h, g] = funPenal(x)

global Rh Rg;

% Function and Constrains
f = x(1).^4 - 2*(x(1).^2).*x(2) + x(1).^2 + x(1).*(x(2).^2) - 2*x(1) + 4;
h = x(1).^2 + x(2).^2 - 2;
g = 0.25*(x(1).^2) + 0.75*(x(2).^2) - 1;

% Penalty Function
p = Rg*max(0,g)^2 + Rh*h^2;

% Modified Function
F = f + p;


