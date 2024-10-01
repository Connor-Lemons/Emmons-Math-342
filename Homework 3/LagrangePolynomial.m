function Poly = LagrangePolynomial(f_vec, x_vec)

    syms x

    P(x) = 0*x;

    for k = 1:length(x_vec)

        L(x) = x/x;

        for i = 1:length(x_vec)

            if (i == k)
                continue
            end

            L(x) = ((x - x_vec(i))/(x_vec(k) - x_vec(i)))*L;

        end

        P(x) = f_vec(k)*L + P;

    end

    Poly = P(x);

end