function [p, i] = fixedPoint(g, p_0, TOL)

    i = 1;
    p = g(p_0);

    while abs(p-p_0) >= TOL

        p_0 = p;
        p = g(p_0);
        i = i + 1;

    end

    

end