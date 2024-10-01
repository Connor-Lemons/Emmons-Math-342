function Q = NevilleMethod(x, f_vec, x_vec)

    Q = zeros(length(x_vec));
    Q = f_vec';

    for i = 2:length(x_vec)

        for j = 2:i

            Q(i,j) = ((x - x_vec(i-j+1))*Q(i,j-1)-(x - x_vec(i))*Q(i-1,j-1))/(x_vec(i) - x_vec(i-j+1));

        end

    end

    Q = [x_vec' Q];

end