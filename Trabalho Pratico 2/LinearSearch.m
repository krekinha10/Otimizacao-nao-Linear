%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
% This is the linearsearch algorythm 
% x -> The initial point to avaliate the function.
% dk -> the Gradient value.
% s -> The step to avaliate the Bracketing algorythm
% Epsi -> The precision to avaliate the Algorythm.
% f -> the function to be evaluated.
% This Algorythm returns an alpha value to be used  in the functions been analyzed.
% =========================================================================

function Alpha = LinearSearch(x,dk,s,Epsi,f)
[a, b] = Bracketing(x,dk,s,f);
alpha= Golden_section(x,dk, a, b, Epsi,f);
Alpha = alpha;
