%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% This is the Golden Section algorythm and is used to define a step size for
% the optimization algorythm.
% this algorythm receives as entries:
% x -> a point at the function domain
% dk -> a search direction
% a,b -> that represents the interval defined by the Bracketing algorythm
% Epsi -> that represents the tolerance to the reduction interval algorythm
% f-> that is a handle to the funciton.
% This algorythm returns an alpha that will be used in the optimization
% algorythms.
% =========================================================================

function GoldenSection = Golden_section(x,dk,a,b,Epsi,f)
[L, C] = size(x);
[D, F] = size(dk);
if(L ~= D)
    x=x';
end
xa = b - 0.618*(b - a);
xb = a + 0.618*(b - a);
thetaA = f(x + xa*dk);
thetaB = f(x + xb*dk);
k = 2;
while (b-a)> Epsi
    if thetaA > thetaB
        a = xa;
        xa = xb;
        xb = a + 0.618*(b - a);
        thetaA = thetaB;
        thetaB = f(x + xb*dk);
        k = k+1;
    else
        b = xb;
        xb = xa;
        xa = b - 0.618*(b - a);
        thetaB = thetaA;
        thetaA = f(x + xa*dk);
        k = k+1;
    end
end
GoldenSection = (a+b)/2;


        