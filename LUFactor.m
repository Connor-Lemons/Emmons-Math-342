function [x, L, U] = LUFactor(a, b)

    n = length(a);
    L = zeros(n);
    U = zeros(n);

    L = eye(n);
    L(2:end, 1) = a(2:end, 1);
    U(1, :) = a(1, :);

    if (U(1, 1) == 0)
        disp("Factorization Impossible")
        return
    end

    for i = 2:n-1

        U(i, i) = a(i, i) - L(i, 1:i-1)*U(1:i-1, i);

        if (U(i, i) == 0)
            disp("Factorization Impossible")
            return
        end

        for j = i+1:n

            U(i, j) = 1/L(i, i)*(a(i, j) - L(i, 1:i-1)*U(1:i-1, j));
            L(j, i) = 1/U(i, i)*(a(j, i) - L(j, 1:i-1)*U(1:i-1, i));

        end

    end

    U(n, n) = a(n, n) - L(n, 1:n-1)*U(1:n-1, n);

    y = zeros(n, 1);
    y(1) = b(1);

    for i = 2:n

        y(i) = b(i) - L(i, 1:i-1)*y(1:i-1);

    end

    x = zeros(n, 1);
    x(n) = y(n)/U(n, n);

    for i = n-1:-1:1

        x(i) = 1/U(i, i)*(y(i) - U(i, i+1:n)*x(i+1:n));

    end

end