function [p, i] = fixedPoint(g, p_0, TOL)

    fprintf("%-15s%-15s%-15s\n", "n", "p_n", "|p_n-p_{n-1}|")
    i = 1;
    p = g(p_0);
    fprintf("%-15.5g%-15.5g%-15.5g\n", i, p, abs(p-p_0))

    while abs(p-p_0) >= TOL

        p_0 = p;
        p = g(p_0);
        i = i + 1;
        fprintf("%-15.5g%-15.5g%-15.5g\n", i, p, abs(p-p_0))

    end

    

end