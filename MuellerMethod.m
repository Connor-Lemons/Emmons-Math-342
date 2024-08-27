function [root, i] = MuellerMethod(coeffs, p_0, p_1, p_2, TOL)

    h_1 = p_1 - p_0;
    h_2 = p_2 - p_1;
    delta_1 = (polyval(coeffs, p_1) - polyval(coeffs, p_0))/h_1;
    delta_2 = (polyval(coeffs, p_2) - polyval(coeffs, p_1))/h_2;
    d = (delta_2 - delta_1)/(h_2+h_1);

    for i = 3:1000

        b = delta_2 + h_2*d;
        D = (b^2 - 4*polyval(coeffs, p_2)*d)^0.5;

        if abs(b-D) < abs(b+D)
            E = b + D;
        else
            E = b - D;
        end

        h = -2*polyval(coeffs, p_2)/E;
        p = p_2 + h;

        if abs(h) < TOL
            root = p;
            break
        end

        p_0 = p_1;
        p_1 = p_2;
        p_2 = p;
        h_1 = p_1 - p_0;
        h_2 = p_2 - p_1;
        delta_1 = (polyval(coeffs, p_1) - polyval(coeffs, p_0))/h_1;
        delta_2 = (polyval(coeffs, p_2) - polyval(coeffs, p_1))/h_2;
        d = (delta_2 - delta_1)/(h_2+h_1);

    end

end