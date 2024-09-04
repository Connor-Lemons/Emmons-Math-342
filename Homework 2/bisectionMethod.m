function [zero_val, iter] = bisectionMethod(f, a, b, TOL)

    n = ceil(log2((1/TOL)*(b-a)));
    
    iter = 1;

    for i=1:n
        disp("---------------")
        iter
        a
        b
        p = (a+b)/2
        vpa(f(p), 4)
        iter = iter + 1;
        if abs(f(p)) < TOL
            break
        elseif f(p)*f(a) < 0
            b = p;
        elseif f(p)*f(b) < 0
            a = p;
        end
    end

    zero_val = p;

end