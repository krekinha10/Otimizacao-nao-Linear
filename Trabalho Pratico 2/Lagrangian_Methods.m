%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
%
%
% This function calculates the optimal point for constraineds functions
% using the Interior Penalty Method (Especifically the Barrier Method).
%
% This function receives:
% f -> a Function or a handle to a function,
% x0 -> the Initial point for analysis using the Method.
% Epsilon -> A minimal value to define a stop criteria for the function
% xLimits -> define limits for the curves
% This function returns the optimal point for the function that is being
% analysed and the number of analysis realized in this function.
% =========================================================================

function x = Lagrangian_Methods (f, xo, Epsilon, xLimit)

global u p lambda mi g h

% Lagrange Multipliers
lambda = 1;
mi = 1;

u = 0.1; 
alpha = 2;
k = 0;
xo = xo(:);

tol = 0.001;
delta= 0.001;
NFC = 2000; 
s = 0.001;
Epsi = 0.001;
Eta = 0.5;

% Store the steps
way(k+1,:) = [xo' feval(f, xo)];

% Print the steps
steps(f, way, k, xLimit); 

x = xo;
x_ant = x;

while (u*p>= Epsilon & feval(f,x)<=feval(f,x_ant))            
 
        x_ant = x;
        x = GradMethod(NFC,x,delta,s,Epsi,tol,f);
    
    if(feval(f,x)>feval(f,x_ant))
        k = k+1;
        x = x_ant;
        way(k+1,:) = [x feval(f, x)];
        steps(f, way, k, xLimit); 
        
        break
    end
    
    mi = mi + u*max(g, -mi/u);
    lambda = lambda + u*h;
    u = alpha*u;
    
    k = k + 1;        
    way(k+1,:) = [x feval(f, x)];
    steps(f, way, k, xLimit);    fprintf('\n')



end
x = x_ant;
figure
plot(0:k,way(:,end),'k-','linewidth',2)
xlabel('Number of Iterations')
ylabel('Value of the Function')




