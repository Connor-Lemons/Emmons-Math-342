function [x] = scaledPivot(a)

    n = size(a, 1);
    nrow = 1:n;
    s = zeros(1, n);

    for i = 1:n

        s(i) = max(a(i, 1:n));

        if (s(i) == 0)
            disp("No Unique Solution")
            return
        end

    end

    for i = 1:n-1

        for p = i:n

            if (abs(a(nrow(p), i))/s(nrow(p)) == max(abs(a(i:n, i))./s(nrow(i:n))))
                break
            end

        end

        if (a(nrow(p), i) == 0)
            disp("No Unique Solution")
            return
        end

        if (nrow(p) ~= nrow(i))
            ncopy = nrow(i);
            nrow(i) = nrow(p);
            nrow(p) = ncopy;
        end

        for j = i+1:n

            m = a(nrow(j), i)/a(nrow(i), i);
            a(nrow(j), :) = a(nrow(j), :) - m*a(nrow(i), :);

        end

    end

    if (a(nrow(n), n) == 0)
        disp("No Unique Solution")
        return
    end

    x = [];
    x(n) = a(nrow(n), n+1)/a(nrow(n), n);

    for i = n-1:-1:1

        sum = 0;
        for j = i+1:n

            sum = sum + a(nrow(i), j)*x(j);

        end

        x(i) = (a(nrow(i), n+1) - sum)/a(nrow(i), i);

    end 

end