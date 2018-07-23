%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% This algorythm is used to optimize a function using the Gradient
% Method,it is composed by the Gradient Algorythm, and for the LinearSearch
% function that is composed by the Golden Section Algorythm and the
% Bracketing Algorythm. The entries for this Algorythm are:
% NFC-> The maximun number of functions avaliation in this method.
% x -> The initial point to avaliate the function.
% delta -> step to avaliate the Gradient.
% s -> The step to avaliate the Bracketing algorythm
% Epsi -> The precision to avaliate the Algorythm.
% tol -> tolerance to avaliate the convergence criteria.
% f -> the function to be evaluated.
%This Algorythm returns the optimal point for the function been analyzed.
% =========================================================================

function Method = GradMethod(NFC,x,delta,s,Epsi,tol,f)
tic;
[L , C]= size(x);
if (L > C)
    x = x';
end
k = 0;
G = Gradiente(f,x,delta);

while (k < NFC) && (feval(f,x)> tol)
    G = Gradiente(f,x,delta);
    ft = f(x);
    dk = -G;
    alpha = LinearSearch(x,dk,s,Epsi,f);
    x = x';

    x = x + alpha*dk;
    x = x';
    k = k + 1;

end
Method = x;
