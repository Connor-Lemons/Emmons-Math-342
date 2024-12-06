function x_sol = NewtonSystem(F, x_0, TOL)

    syms x1 x2

    x_NewtonSystem = x_0;

    for k = 1:1000
        J(x1, x2) = jacobian(F);
        y = mldivide(double(J(x_NewtonSystem(1), x_NewtonSystem(2))), double(-F(x_NewtonSystem(1), x_NewtonSystem(2))));
    
        x_NewtonSystem = x_NewtonSystem + y;
        x_sol(:, k) = x_NewtonSystem;
    
        if max(abs(y)) < TOL
            break
        end
    end
    
    x_sol = [zeros(2,1) x_sol];

end