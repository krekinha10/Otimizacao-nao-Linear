%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% This algorythm is used to optimize a function using the Newton
% Method.
% NFC-> The number of functions avaliation in this method.
% x -> The initial point to avaliate the function.
% delta -> step to avaliate the Gradient.
% s -> The step to avaliate the Bracketing algorythm
% Epsi -> The precision to avaliate the Algorythm.
% tol -> tolerance to avaliate the convergence criteria.
% f -> the function to be evaluated.
% This Algorythm returns the optimal point for the function been analyzed.
% =========================================================================

function [Newton, NFC_ans, IterNW, TIMENM] = NewtonMethod(NFC,x,delta,s,Epsi,tol,f)
tic;
[L , C]= size(x);
if (L > C)
    x = x';
end
k = 0;
[Gk NFCG1]= Gradiente(f,x,delta);
NFCGT=NFCG1;
NFCHT=0;
NFCtotal = 0;
NFCLST=0;

while (feval(f,x) > tol) && (NFCtotal<= NFC)
  
    [Gk NFCG2] = Gradiente(f,x,delta);
    [Hk NFCH] = Hessian_Otm(f,x,delta);
    dk = - inv(Hk)*(Gk);
    dkt=dk';
    
    [alpha NFCLS] = LinearSearch(x,dkt,s,Epsi,f);

    
    x = x + alpha*dkt;

    
    NFCGT = NFCGT + NFCG2;
    NFCLST = NFCLST + NFCLS;
    NFCHT = NFCHT + NFCH;
    NFCtotal = NFCGT +NFCLST + NFCHT;

    k = k + 1;
end
Newton = x';
NFC_ans = NFCtotal;
IterNW = k;
TIMENM = toc;
