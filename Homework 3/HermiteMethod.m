function [F] = HermiteMethod(f_diff_vec, f_vec, x_vec)

    F = zeros(2*length(x_vec), 2*length(x_vec) + 1);

    for i = 1:length(x_vec)

        F(2*i-1, 1) = x_vec(i);
        F(2*i, 1) = x_vec(i);
        F(2*i-1, 2) = f_vec(i);
        F(2*i, 2) = f_vec(i);
        F(2*i, 3) = f_diff_vec(i);
        if (i ~= 1)
            F(2*i-1, 3) = (F(2*i-1, 2) - F(2*i-2, 2))/(F(2*i-1, 1) - F(2*i-2, 1));
        end

    end

    for i = 3:2*length(x_vec)

        for j = 4:i+1

            F(i,j) = (F(i, j-1) - F(i-1, j-1))/(F(i, 1) - F(i-j+2, 1));

        end

    end

end