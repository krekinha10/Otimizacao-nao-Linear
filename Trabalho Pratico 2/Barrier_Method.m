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
% f -> a Function or a handle to a function
% xo -> the Initial point for analysis using the Method.
% rh-> Penalty Multipliers
% rg-> Penalty Multipliers
% ch-> Penalty Multipliers
% cg-> Penalty Multipliers
% xLimits -> define limits for the curves
% This function returns the optimal point for the function that is being
% analysed and the number of analysis realized in this function.
% =========================================================================

function x = Barrier_Method(f, xo, rh, ch, rg, cg,xLimit)
 
global Rh Rg; 
 
    Rh = rh;
    Rg = rg;
    k = 0;
    x= xo;

    tol = 0.001;
    delta= 0.001;
    NFC = 20000; 
    s = 0.001;
    Epsi = 0.001;
    Eta = 0.5;
    
    % Store the steps
    way(k+1,:) = [xo feval(f, xo)];

    % Print the steps
    steps(f, way, k, xLimit); 
    
    while (k <= NFC)
        
        x_ant = x;
        vet_xk(:,k+1) = x;
        [fk_ant,hk,gk] = feval(f,x_ant);
        Rh = Rh*ch;
        Rg = Rg*cg;
        x = GradMethod(NFC,x,delta,s,Epsi,tol,f); 
        fk = feval(f,x);
        del_fk = abs(fk_ant - fk);
        if del_fk < 0.1
            k= k+1;
            % Store the steps
            way(k+1,:) = [x feval(f, x)];
            % Print the steps
            steps(f, way, k, xLimit); 
            break
        end
        k= k+1;
        % Store the steps
        way(k+1,:) = [x feval(f, x)];
        % Print the steps
        steps(f, way, k, xLimit); 
    end
x = x';
fprintf('\n')

figure
plot(0:k,way(:,end),'k-','linewidth',2)
xlabel('Number of Iteractions')
ylabel('Value of the function')

