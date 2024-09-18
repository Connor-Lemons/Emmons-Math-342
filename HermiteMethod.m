function [F] = HermiteMethod(x, y)

    F = y';

    for i = 1:length(x)

        z(2*i) = x(i);
        z(2*i+1) = x(i);

    end

    

    for i = 2:length(x)

        for j = 2:i

            F(i,j) = (F(i, j-1) - F(i-1, j-1))/(x(i) - x(i-j+1));

        end

    end

end