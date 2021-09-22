% Function: newton.m
% 
% Descripción:
% Esta funcion encuentra el minimo de una curva en 2d.
% Utiliza la primera y segunda derivada de la funcion objetivo para
% entontrar el minimo. Esto se cumple cuando la primera derivada es igual a
% 0
%
% Parámetros:
% g (syms function): funcion objetivo a minimizar
% xk0 (float): punto inicial para empezar la busqueda del minimo
%
% Output: 
% xk1 (double): punto (en el eje x) que minimiza la funcion.
function xk1 = newton(g, xk0)
    % Obtener la funcion syms
    syms x
    f(x) = g(x); 
    
    % Calcular primera y segunda derivada
    df1(x) = diff(f, x);
    df2(x) = diff(df1, x);

    xk1 = xk0 - df1(xk0)/df2(xk0);
    epsilon = 0.001;

    while (abs(xk1 - xk0) > epsilon)
        xk0 = xk1;
        xk1 = xk0 - df1(xk0)/df2(xk0);
    end
    
    % convertir xk1 en double
    xk1 = double(xk1);
end