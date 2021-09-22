% Function: ajusteCuadratico.m
% 
% Descripción:
% Esta funcion encuentra el minimo de una curva en 2d.
% Ajuste mediante la interpolacion de tres puntos a una parabola que
% contiene el punto optimo

% Requerimientos: 
% La funcion g en el intervalo [x1, x3] debe ser cuasiconvexa.

% Parámetros:
% g (syms function): funcion objetivo a minimizar
% x1 (float): punto inicial para crear la parabola que se va a optimizar
% x2 (float): punto medio para crear la parabola que se va a optimizar
% x3 (float): punto final para crear la parabola que se va a optimizar
%
% Output: 
% xk (double): punto (en el eje x) que minimiza la funcion.
function xk = ajusteCuadratico(g, x1, x2, x3)    
    epsilon = 0.001;
    
    % Obtener la funcion syms
    syms x
    f(x) = g(x); 
    
    while (x3 - x1 > epsilon)
        
        % Calcular xk
        xA = (x2^2-x3^2)*f(x1) + (x3^2-x1^2)*f(x2) + (x1^2-x2^2)*f(x3);
        xB = 2*((x2-x3)*f(x1) + (x3-x1)*f(x2) + (x1-x2)*f(x3));
        xA = double(xA);
        xB = double(xB);
        xk = xA/xB;
        if (xk > x2) % Paso 2
            if (f(xk) > f(x2))
                x3 = xk;
            else 
                x1 = x2;
                x2 = xk;
            end
            
        elseif (xk < x2) % Paso 3
            
            if (f(xk) > f(x2))
                x1 = xk;
            else 
                x3 = x2;
                x2 = xk;
            end
        elseif (xk == x2) % Paso 4
               if (x2 - x1 < x3 - x2)
                   xk = x2 + epsilon/2;
               else
                   xk = x2 - epsilon/2;
               end
        end
           
    end
    
end