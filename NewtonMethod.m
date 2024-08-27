function [p, i] = NewtonMethod(f, p_0, TOL)
    
    syms x
    f_prime = diff(f, x);
    
    for i = 1:1000
    
        p = p_0 - f(p_0)/f_prime(p_0);
    
        if abs(p - p_0) < TOL
            break
        end
    
        p_0 = p;
    
    end

    p = vpa(p);

end