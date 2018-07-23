%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% This is the Bracktering Algorythm, this is used to reduce the search
% interval.
% the entries in this algorythm are:
% x -> a point x in the function domain
% dk -> a search direction, the can come from the gradient algorythm or from
% other methods.
% s -> the initial step.
% f -> a handle to the function that are being examined.
% This function returns an intervall to analyze the function.
% =========================================================================
function[A, B, NFC]= Bracketing (x,dk,s,f)
[L, C] = size(x);
[D, F] = size(dk);
if(L ~= D)
    x=x';
end
a = 0;
b = s;

thetaA = f(x + a*dk);
thetaB = f(x + b*dk);
k = 2;
while thetaB < thetaA
    a = b;
    thetaA = thetaB;
    b = 2*b;
    thetaB = f(x + b*dk);
    k = k + 1;
end

if k <= 3
    a = 0;
else
    a = a/2;
end

A = a;
B = b;
NFC = k;