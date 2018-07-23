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
% This function calculates the numeric approximation to the Gradient of a
% function.
% This function receives:
% f -> a Function or a handle to a function, 
% x -> a point in space that can be a variable for a unidimensional function
% or a vector to a bidimenssional, tridimensional or n-dimensional function.
% delta -> that is the interval of variation to the x variable used to evaluate
% the gradient.
% This function returns the gradient for the function that is being
% analysed and the number of analysis realized in this function.
% =========================================================================


function gradient = Gradiente(f,x,delta)
[L , C]= size(x);
NFC1 = 0;
if (L > C)
    x=x';
    for i = 1:L
    k=x;
    k(i)= x(i)+delta;
    s(i)=((f(k)-f(x))/delta);
    NFC1= NFC1+1;
    end
else
    for i = 1:C
    k=x;
    k(i)= x(i)+delta;
    s(i)=((f(k)-f(x))/delta);
    NFC1= NFC1+1;
    end
end 
gradient=s';
