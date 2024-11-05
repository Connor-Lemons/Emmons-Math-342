function eval = SimpsonRule(x_vec, f)

    syms x

    h = (x_vec(end) - x_vec(1))/(length(x_vec) - 1);

    eval = h/3*(f(x_vec(1)) + 4*f(x_vec(2)) + f(x_vec(3)));

end