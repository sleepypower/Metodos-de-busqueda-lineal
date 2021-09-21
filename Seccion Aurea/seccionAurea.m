clear
close all
clc

% Iniciar variables
a = -3;
b = 2;

% Plot function
syms x
funcion(x) = x^2 + 2*x + 1;
fplot(funcion,[-10 10])
hold on

% Valores Iniciales
lambda_k=a+(1-0.618)*(b-a);
miu_k=a+0.618*(b-a);
f_lambda_k=funcion(lambda_k)
f_miu_k=funcion(miu_k)
b_k=b;
a_k=a;
k=0
I=0.001

% Algoritmo
while b_k-a_k >= I
    %paso 2:
    if f_lambda_k > f_miu_k
        a_k = lambda_k
        lambda_k = miu_k
        miu_k = a_k+0.618*(b_k-a_k);

    %paso 3:
    elseif f_miu_k > f_lambda_k
        b_k = miu_k;
        miu_k = lambda_k;
        lambda_k = a_k + (1 - 0.618)*(b_k - a_k);
        
    end
    f_lambda_k = funcion(lambda_k);
    f_miu_k = funcion(miu_k);
    
    % Plot points
    
    plot(a, funcion(a), 'o');
    plot(miu_k, f_miu_k, 'o');
    plot(lambda_k, f_lambda_k, 'o');
    plot(b, funcion(b), 'o')
    
    k=k+1;
    
    %hold on
    
end
