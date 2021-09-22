clear
clc

syms x
g(x) = (x^2)/10 - 2*sin(x); 

a = ajusteCuadratico(g, 0, 1, 4)
b = newton(g, 2.5)

double(g(a))
double(g(b))




