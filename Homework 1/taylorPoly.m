function [P] = taylorPoly(f, n, x_0)

    syms x

    P(x) = f(x_0);

    for i = 1:n

        P = P + subs(diff(f, i), x, x_0)/factorial(i)*(x - x_0)^i;
        
    end
end