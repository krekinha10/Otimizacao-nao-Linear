function F = funLagran(x)

global u p mi lambda g h

x = x(:);
h = [];
g = [];


% Function and Constrains
f = x(1).^4 - 2*(x(1).^2).*x(2) + x(1).^2 + x(1).*(x(2).^2) - 2*x(1) + 4;
h(1) = x(1).^2 + x(2).^2 - 2;
g(1) = 0.25*(x(1).^2) + 0.75*(x(2).^2) - 1;

% Lagragian Function
p = sum(max(g, -mi/u)).^2 + sum((h+lambda/u).^2);

% Modified Function
F = f + u*p;


