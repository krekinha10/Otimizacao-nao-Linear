%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% The entries for this Algorythm are:
% NFC-> The number of functions avaliation in this method.
% x -> The initial point to avaliate the function.
% delta -> step to avaliate the Gradient.
% s -> The step to avaliate the Bracketing algorythm
% Epsi -> The precision to avaliate the Algorythm.
% tol -> tolerance to avaliate the convergence criteria.
% f -> the function to be evaluated.
% =========================================================================

% Using Fletcher Reeves
function [ConjGradient, NFC, IterCG, TIMECG] = ConjGrad(NFC,x,delta,s,Epsi,tol,f)
tic;
[L , C]= size(x);
if (L > C)
    x = x';
end
k=0;
[Gk NFCG1]= Gradiente(f,x,delta);
Rk= -Gk;
Dk = Rk;
NFCGT=NFCG1;
NFCLST=0;
NFCHT=0;
NFCtotal =0;

while (NFCtotal < NFC) && (feval(f,x)> tol)
    
    Rka = Rk;
    [alpha, NFCLS] = LinearSearch(x,Dk,s,Epsi,f);
    x = x' + alpha*Dk;
    [Gk, NFCG2]= Gradiente(f,x,delta);
    Rk = -Gk;
    beta = (Rk'*Rk)/(Rka'*Rka);
    Dk = Rk + beta*Dk;
    x = x';
    
   
    NFCGT = NFCGT + NFCG2;
    NFCLST = NFCLST + NFCLS;
    NFCtotal = NFCG1 +NFCLST;
   
    k  = k+1;
    
end
ConjGradient = x;
NFC = NFCtotal;
IterCG = k;
TIMECG = toc;
