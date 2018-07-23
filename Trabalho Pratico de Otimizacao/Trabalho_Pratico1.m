%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% =========================================================================

% Script to simulate the optimization process of two function.
Selection = input('This is simulation process for the optimization of 2 different functions, if you wanna enter all the coeficients press 1 or with you only wanna run a predefined simulation enter 2: \n');

if (Selection == 1)
        % Entering:
        x = input('Enter the initial point for the analysis of function 1: \n');
        x2 = input('Enter the initial point for the analysis of function 2: \n');
        tol = input('Enter the minimum tolerance for the gradient norm: \n');
        NFC = input('Enter the maximun number of Functions avaliation: \n');
        delta = input('Enter the step size to calculate the gradient of a function: \n');
        s = input('Enter the step size for the Bracketing algorythm: \n');
        Epsi = input('Enter the minimum tolerance for the gradient norm: \n');
        Eta = input('Enter the coeficient to measure the influence of the DFP and BFGS methods: \n');
else
    % Assuming;
    x= [-1.2 ; 1.0]; 
    x2 = [ 5.0 ;5.0 ;5.0 ;5.0 ;5.0 ;5.0 ;5.0 ;5.0 ;5.0 ;5.0];
    tol = 0.0001;
    delta= 0.0001;
    NFC = 2000; 
    s = 0.001;
    Epsi = 0.0001;
    Eta = 0.5;

end

f1 = @objfun1;

[Minimum_GradMethod,NFC_GradMethod, Iteration_Number_GradMethod, TIMEGM] = GradMethod(NFC,x,delta,s,Epsi,tol,f1);
[Minimum_Newton, NFC_Newton, Iteration_Number_Newton, TIMENM] = NewtonMethod(NFC,x,delta,s,Epsi,tol,f1);
[Minimum_SemiNewton, NFC_SemiNewton, Iteration_Numbe_SemiNewton, TIMESM ] = QuaseNewton (NFC,x,delta,s,Epsi,tol,Eta,f1);
[Minimum_ConjGradient, NFC_ConjGradient, Iteration_Number__ConjGradient, TIMECG] = ConjGrad(NFC,x,delta,s,Epsi,tol,f1);

rownames = {'Gradient Method';'Modified Newton';'SemiNewton';'Conjugated Gradient'};
Minimun_PointX = [Minimum_GradMethod(1);Minimum_Newton(1);Minimum_SemiNewton(1);Minimum_ConjGradient(1)];
Minimun_PointY = [Minimum_GradMethod(2);Minimum_Newton(2);Minimum_SemiNewton(2);Minimum_ConjGradient(2)];
Number_of_Function_Avaliation = [NFC_GradMethod; NFC_Newton;NFC_SemiNewton;NFC_ConjGradient];
Number_of_Iteractions = [Iteration_Number_GradMethod;Iteration_Number_Newton;Iteration_Numbe_SemiNewton;Iteration_Number__ConjGradient];
Execution_TIME= [ TIMEGM; TIMENM; TIMESM; TIMECG];
T1= table(Minimun_PointX,Minimun_PointY,Number_of_Function_Avaliation,Number_of_Iteractions,Execution_TIME,'RowNames',rownames)

f2 = @objfun2;

[Minimum_GradMethod, NFC_GradMethod, Iteration_Number_GradMethod, TIMEGM] = GradMethod(NFC,x2,delta,s,Epsi,tol,f2);
[Minimum_Newton, NFC_Newton, Iteration_Number_Newton, TIMENM] = NewtonMethod(NFC,x2,delta,s,Epsi,tol,f2);
[Minimum_SemiNewton, NFC_SemiNewton, Iteration_Number_SemiNewton, TIMESM] = QuaseNewton (NFC,x2,delta,s,Epsi,tol,Eta,f2);
[Minimum_ConjGradient, NFC_ConjGradient, Iteration_Number__ConjGradient, TIMECG] = ConjGrad(NFC,x2,delta,s,Epsi,tol,f2);



rownames = {'Gradient Method';'Modified Newton';'SemiNewton';'Conjugated Gradient'};
Number_of_Function_Avaliation = [NFC_GradMethod; NFC_Newton;NFC_SemiNewton;NFC_ConjGradient];
Number_of_Iteractions = [Iteration_Number_GradMethod;Iteration_Number_Newton;Iteration_Numbe_SemiNewton;Iteration_Number__ConjGradient];
Execution_TIME= [TIMEGM;TIMENM;TIMESM;TIMECG];
T2 = table(Number_of_Function_Avaliation,Number_of_Iteractions,Execution_TIME,'RowNames',rownames)



rownames = {'Gradient Method';'Modified Newton';'SemiNewton';'Conjugated Gradient'};
X1 = [Minimum_GradMethod(1);Minimum_Newton(1);Minimum_SemiNewton(1);Minimum_ConjGradient(1)];
X2 = [Minimum_GradMethod(2);Minimum_Newton(2);Minimum_SemiNewton(2);Minimum_ConjGradient(2)];
X3 = [Minimum_GradMethod(3);Minimum_Newton(3);Minimum_SemiNewton(3);Minimum_ConjGradient(3)];
X4 = [Minimum_GradMethod(4);Minimum_Newton(4);Minimum_SemiNewton(4);Minimum_ConjGradient(4)];
X5 = [Minimum_GradMethod(5);Minimum_Newton(5);Minimum_SemiNewton(5);Minimum_ConjGradient(5)];
X6 = [Minimum_GradMethod(6);Minimum_Newton(6);Minimum_SemiNewton(6);Minimum_ConjGradient(6)];
X7 = [Minimum_GradMethod(7);Minimum_Newton(7);Minimum_SemiNewton(7);Minimum_ConjGradient(7)];
X8 = [Minimum_GradMethod(8);Minimum_Newton(8);Minimum_SemiNewton(8);Minimum_ConjGradient(8)];
X9 = [Minimum_GradMethod(9);Minimum_Newton(9);Minimum_SemiNewton(9);Minimum_ConjGradient(9)];
X10 = [Minimum_GradMethod(10);Minimum_Newton(10);Minimum_SemiNewton(10);Minimum_ConjGradient(10)];
T3 = table(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,'RowNames',rownames)