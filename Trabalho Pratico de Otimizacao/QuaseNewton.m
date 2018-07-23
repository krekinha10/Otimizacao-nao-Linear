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
% NFC-> The number of functions avaliation in this method.
% x -> The initial point to avaliate the function.
% delta -> step to avaliate the Gradient.
% s -> The step to avaliate the Bracketing algorythm
% Epsi -> The precision to avaliate the Algorythm.
% tol -> tolerance to avaliate the convergence criteria.
% Eta -> coeficient to measure the influcience of the DFP or BFSG
% algorythm.
% f -> the function to be evaluated.
% =========================================================================

function [SemiNewton, NFC, IterSN, TIMESM] = QuaseNewton (NFC,x,delta,s,Epsi,tol,Eta,f)
tic;
[L , C]= size(x);
if (L > C)
    x = x';
end
k = 0;
Size = length(x);
H = eye(Size);
[G NFCG1] = Gradiente(f,x,delta);
NFCGT = NFCG1;
NFCLST = 0;
NFCtotal=0;
NFCLST= 0;

while (NFCtotal < NFC) && (feval(f,x) > tol)
    dk = -H*G;
    [alpha, NFCLS] = LinearSearch(x,G,s,Epsi,f);
    xk = x' + alpha*dk;
    [Gk, NFCG2] = Gradiente(f,xk',delta);
    Vk = xk - x';
    Rk = Gk - G;
    G = Gk;
    Cdfp = ((Vk*Vk')/(Vk'*Rk)) - ((H*Rk*Rk'*H)/(Rk'*H*Rk));
    Cbfg = (1 + (Rk'*H*Rk)/(Rk'*Vk))*((Vk*Vk')/(Vk'*Rk))-((Vk*Rk'*H+H*Rk*Vk')/(Rk'*Vk));
    Ck= (1-Eta)*Cdfp + Eta*Cbfg;
    Hk = H + Ck;
    NFCGT = NFCGT + NFCG2;
    NFCLST = NFCLST + NFCLS;
    NFCtotal = NFCGT +NFCLST;

    x=xk';
    k = k+1;
    
end
SemiNewton = x;
NFC = NFCtotal;
IterSN = k ;
TIMESM = toc;
