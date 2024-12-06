function [x] = JacobiIter(A, B, x_0, TOL)

    x = x_0;
    XO = x_0;

    for k = 1:1000

        for i = 1:length(x_0)

            sum = 0;
    
            for j = 1:length(x_0)
    
                if (j == i)
                    continue
                end
    
                sum = sum + A(i, j)*XO(j);
    
            end
    
            x(i, k) = (1/A(i, i))*(-sum + B(i));

        end

        if (max(abs(x(:, k) - XO)) < TOL)
            x = [x_0 x];
            return
        end

        XO = x(:, k);

    end

end