function [p, i] = NewtonMethod(f, p_0, TOL)
    
    syms x
    f_prime = diff(f, x);

    fprintf("%-15s%-15s%-15s\n", "n", "p_n", "|p_n-p_{n-1}|")
    
    for i = 1:20
    
        p = p_0 - f(p_0)/f_prime(p_0);

        fprintf("%-15.7g%-15.7g%-15.7g\n", i, p, abs(p-p_0))
    
        if abs(p - p_0) < TOL
            break
        end
    
        p_0 = p;
    
    end

    p = vpa(p);

end