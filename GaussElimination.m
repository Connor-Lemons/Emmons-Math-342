function [x] = GaussElimination(a)

    n = size(a, 1);

    for i = 1:n-1

        p_sol = -1;

        for p = i:n

            if (a(p, i) ~= 0)
                p_sol = p;
                break
            end

        end

        if (p_sol == -1)
            disp("No Unique Solution")
            return
        end

        if (p ~= i)
            temp = a(p, :);
            a(p, :) = a(i, :);
            a(i, :) = temp;
        end

        for j = i+1:n

            m = a(j, i)/a(i, i);
            a(j, :) = a(j, :) - m*a(i, :);

        end

    end

    if (a(n, n) == 0)
        disp("No Unique Solution")
        return
    end

    x = [];
    x(n) = a(n, n+1)/a(n, n);

    for i = n-1:-1:1

        sum = 0;
        for j = i+1:n

            sum = sum + a(i, j)*x(j);

        end

        x(i) = (a(i, n+1) - sum)/a(i, i);

    end

end