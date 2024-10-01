function [F] = dividedDifference(f_vec, x_vec)

    F = f_vec';

    for i = 2:length(x_vec)

        for j = 2:i

            F(i,j) = (F(i, j-1) - F(i-1, j-1))/(x_vec(i) - x_vec(i-j+1));

        end

    end

end