clear;clc;close

Re = 5000
''' Este código é a resolução do exercício 4.8 (item a) do Livro: Métodos Numéricos para Engenheiros Químicos - Algoritmos e aplicaçõe  - Argimiro R. Secchi e Evaristo C. Biscaia Jr. '''

function f = func(x)
    f = sqrt(x) - x*(1.74*log(Re*sqrt(x)-0.4))
endfunction

x0 = 0.316*(Re^(-0.25)) // Chute Inicial 
tol = 1e-6 
ITMAX = 1000 // Iterações 
f0 = func(x0)
df0 = numderivative(func, x0)
passo = -f0/df0
IT = 0 

while abs(f0) > tol & IT < ITMAX
    x1 = x0 + passo 
    f1 = func(x1)
    if abs(f1) < abs (f0) then 
        x0 = x1 
        f0 = f1
       df0 = numderivative(func, x0)
       passo = -f0/df0
    else
        passo = passo/2
    end
end
