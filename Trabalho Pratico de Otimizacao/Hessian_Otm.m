%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Eltroeletrônica
%
% Aluno:
%   Rafael Lazaro Monteiro       2017435036
%   Engenharia de Sistemas
% Nota:
%
% This is the Hessina function to calculate a numeric approximation to the Hessian of a
% function.
% This function receives:
% f -> a Function, 
% x -> a point in space that can be a variable for a unidimensional function
% or a vector to a bidimenssional, tridimensional or n-dimensional function.
% delta -> that is the interval of variation to the x variable.
% This algorythm return the Hessian Matrix to the function being analyzed
% =========================================================================


function [Hessian NFC] = Hessian_Otm(f,x,delta)
[L , C]= size(x);
NFC = 0;
[L , C]= size(x);
NFC1 = 0;
if (L > C)
    x=x';
    for i = 1:L
        k=x;
        k(i)= x(i)+delta;
        H(:,i)=((Gradiente(f,k,delta)- Gradiente(f,x,delta))/delta);
        NFC= NFC+1;
    end
else
     for i = 1:C
        k=x;
        k(i)= x(i)+delta;
        H(:,i)=((Gradiente(f,k,delta)- Gradiente(f,x,delta))/delta);
        NFC= NFC+1;
     end
end 
Hessian = H;
NFC = NFC;