function [p, i] = SteffensenMethod(g, p_0, TOL)

    i = 1;
    p_0(i) = p_0;
    p_1(i) = g(p_0(i));
    p_2(i) = g(p_1(i));
    p = p_0(i) - (p_1(i) - p_0(i))^2/(p_2(i) - 2*p_1(i) + p_0(i));

    while abs(p-p_0(i)) >= TOL
        
        i = i + 1;
        p_0(i) = p;
        p_1(i) = g(p_0(i));
        p_2(i) = g(p_1(i));
        p = p_0(i) - (p_1(i) - p_0(i))^2/(p_2(i) - 2*p_1(i) + p_0(i));

    end

end