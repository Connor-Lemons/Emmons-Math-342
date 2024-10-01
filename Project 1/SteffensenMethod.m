function [p_vec, p, i] = SteffensenMethod(g, p_0, TOL)

    fprintf("%-15s%-15s%-15s\n", "n", "p_n", "|p_n-p_{n-1}|");
    i = 1;
    p_0(i) = p_0;
    p_1(i) = g(p_0(i));
    p_2(i) = g(p_1(i));
    p = p_0(i) - (p_1(i) - p_0(i))^2/(p_2(i) - 2*p_1(i) + p_0(i));
    p_vec(i) = p;
    fprintf("%-15.5g%-15.5g%-15.5g\n", i, p, abs(p-p_0(i)))

    while vpa(abs(p-p_0(i))) >= TOL
        
        i = i + 1;
        p_0(i) = p;
        p_1(i) = g(p_0(i));
        p_2(i) = g(p_1(i));
        p = p_0(i) - (p_1(i) - p_0(i))^2/(p_2(i) - 2*p_1(i) + p_0(i));
        p_vec(i) = p;
        fprintf("%-15.5g%-15.5g%-15.5g\n", i, p, abs(p-p_0(i)));

    end

end