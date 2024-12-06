function [x] = GaussSiedel(A, B, x_0, TOL)

    x = x_0;
    XO = x_0;

    for k = 1:1000

        for i = 1:length(x_0)

            sum_1 = 0;
    
            for j = i+1:length(x_0)
    
                if (j == i)
                    continue
                end
    
                sum_1 = sum_1 + A(i, j)*XO(j);
    
            end

            sum_2 = 0;

            for j = 1:i-1

                sum_2 = sum_2 + A(i, j)*x(j, k);

            end
    
            x(i, k) = (1/A(i, i))*(-sum_1 - sum_2 + B(i));

        end

        if (max(abs(x(:, k) - XO)) < TOL)
            x = [x_0 x];
            return
        end

        XO = x(:, k);

    end

end