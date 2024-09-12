function [F] = dividedDifference(x, y)

    F = y';

    for i = 2:length(x)

        for j = 2:i

            F(i,j) = (F(i, j-1) - F(i-1, j-1))/(x(i) - x(i-j+1));

        end

    end

end