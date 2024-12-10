function [lambda, eig] = powerEig(A, x, TOL)

    [x_p, p] = max(abs(x));
    x = x/x_p;

    for i = 1:1000

        y = A*x;
        lambda = y(p);
        [y_p, p] = max(abs(y));

        if (y_p == 0)
            eig = x;
            disp("A has the eigenvalue 0, select a new vector and restart")
            return
        end

        err = norm(x - (y/y(p)), inf);
        x = y/y(p);

        if (err < TOL)
            eig = x;
            return
        end

    end

    disp("Need more iterations")

end