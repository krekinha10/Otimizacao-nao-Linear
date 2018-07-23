%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Note: 
% This is a script the implements and executes the Constrained Optimization
% methods for the Practical work 02
% =========================================================================
Selection = input('This Script is designed to run three differents optimization algorithms if you want to run Barrier Algorithm for the function 1 at the PW02 enter 1, for the Augmented Lagrange for the function 1 enter 2, and for the Penalty for the function 2:  '); 

if (Selection == 1)
    xo = [0,0];
    rh = 0.1;
    rg = 0.1;
    ch = 5;
    cg = 5;
    
    xLimit= [-1 4 -1 4];
    x = Penalty_method(@funPenal, xo, rh, ch, rg, cg, xLimit);
    x
else if (Selection == 2)
        xo = [2,-4];
        rh = 1;
        rg = 10;
        ch = 1;
        cg = 0.1;
        xLimit= [0 8 -6 8];
        
        x = Barrier_Method(@funBarrier, xo, rh, ch, rg, cg,xLimit)
    else if (Selection == 3)
            xo = [0,0];
            Epsilon = 0.05;
            xLimit= [-1 4 -1 4];
            x = Lagrangian_Methods (@funLagran, xo, Epsilon, xLimit)
        end
    end
end