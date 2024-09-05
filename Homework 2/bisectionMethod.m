function [zero_val, iter] = bisectionMethod(f, a, b, TOL)

    n = ceil(log2((1/TOL)*(b-a)));
    
    iter = 1;

    fprintf("%-15s%-15s%-15s%-15s%-15s\n", "n", "a", "b", "p", "f(p)")
    for i=1:n
        p = (a+b)/2;
        vpa(f(p), 4);
        fprintf("%-15.5g%-15.5g%-15.5g%-15.5g%-15.5g\n",...
            iter, a, b, p, f(p))
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