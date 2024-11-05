function [XI] = compositeSimpson(f, a, b, n)

    syms x
    f(x) = f;
    
    h = (b - a)/n;
    
    XI0 = f(a) + f(b);
    XI1 = 0;
    XI2 = 0;

    for i = 1:n-1

        X = a + i*h;
        
        if (mod(i, 2) == 0)
            XI2 = XI2 + f(X);
        elseif (mod(i, 2) == 1)
            XI1 = XI1 + f(X);
        end

    end

    XI = h*(XI0 + 2*XI2 + 4*XI1)/3;

end