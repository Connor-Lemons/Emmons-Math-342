function [zero_val, iter] = bisectionMethod(f, a, b, TOL)

    n = ceil(log2((1/10e-4)*(b-a)));
    
    iter = 0;

    for i=1:n
        p = (a+b)/2;
        iter = iter + 1;
        zero_val = p;
        if abs(f(p)) < TOL
            break
        elseif f(p)*f(a) < 0
            b = p;
        elseif f(p)*f(b) < 0
            a = p;
        end
    end

end