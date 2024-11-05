function [a, b, c, d] = naturalSpline(f_vec, x_vec)

    h = zeros(1, length(x_vec) - 1);

    for i = 1:length(x_vec) - 1

        h(i) = x_vec(i+1) - x_vec(i);

    end

    alpha = zeros(1, length(x_vec) - 2);

    for i = 2:length(x_vec) - 1

        alpha(i) = 3/h(i)*(f_vec(i+1) - f_vec(i)) - 3/h(i-1)*(f_vec(i) - f_vec(i-1));

    end

    l(1) = 1;
    mu(1) = 0;
    z(1) = 0;

    for i = 2:length(x_vec) - 1

        l(i) = 2*(x_vec(i+1) - x_vec(i-1)) - h(i-1)*mu(i-1);
        mu(i) = h(i)/l(i);
        z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);

    end

    l(length(x_vec)) = 1;
    z(length(x_vec)) = 0;
    c(length(x_vec)) = 0;

    for j = length(x_vec) - 1:-1:1

        c(j) = z(j) - mu(j)*c(j+1);
        b(j) = (f_vec(j+1) - f_vec(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
        d(j) = (c(j+1) - c(j))/(3*h(j));

    end

    a = f_vec(1:end-1);
    c = c(1:end-1);

    

end