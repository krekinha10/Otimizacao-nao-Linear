%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% Function to adequate the mesh to the curve.
% =========================================================================


function z = get_fitness (fun, x, y)

[L,C] = size(x);
for i = 1:L
    for j = 1:C        
        z(i,j) = feval(fun, [x(i,j) y(i,j)]);
    end
end



