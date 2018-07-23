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
% This Function is used only with the intent to print the curves for the
% Practical Work
% =========================================================================


function steps (fun, vector, k, xlimits)

% Prints a table with the results.
if (k == 0) fprintf('\n'), end

tam   = length(xlimits);
[L,C] = size(vector);

fprintf(1, 'x = [')
fprintf(1, '%+6.4f  ', vector(L,1:end-1)')
fprintf(1, '\b\b]; \t f(x) = %+6.4f; \t k = %d\n', vector(L,end),k)
% =========================================================================

% this part only works for 2D functions.
if (tam ~= 4)    
    return
end

%==========================================================================
% Plot the level curves
if (k == 0)
    % closes the window
    close
    
    % Plot the level curves   
    deltax = (xlimits(2) - xlimits(1))/30;
    deltay = (xlimits(4) - xlimits(3))/30;
    [x, y] = meshgrid(xlimits(1):deltax:xlimits(2), ...
                      xlimits(3):deltay:xlimits(4));    
    hold on
    z = get_fitness(fun, x, y);      
    cnivel = [linspace(0,vector(L,end),10) linspace(vector(L,end),vector(L,end)+50,10)];
    
    % Plot em 2D
    c = contour(x,y,z,cnivel); clabel(c), grid off
    
    % or,
    
    % Plot em 3D
    %mesh(x,y,z); box off, view([10 70])
end
%==========================================================================

% =========================================================================
% Prints the iteractive process
xlabel('x1'), ylabel('x2'), zlabel('f(x)')
plot3 (vector(:,1), vector(:,2), vector(:,3), 'k*-')
axis(xlimits);
if (k == 0), pause, else pause(0.01), end


