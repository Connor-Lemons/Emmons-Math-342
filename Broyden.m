function x_sol = Broyden(F, x_0, TOL)

    syms x1 x2

    x_Broyden = x_0;

    J(x1,x2) = jacobian(F);
    
    A = inv(J(x_0(1), x_0(2)));
    v = F(x_0(1), x_0(2));

    s = -A*v;
    x_Broyden = x_Broyden + s;
    x_sol(:, 1) = x_Broyden;

    for k = 2:1000

        w = v;
        v = F(x_Broyden(1), x_Broyden(2));
        y = v - w;
        z = -A*y;
        p = -s'*z;
        u_trans = s'*A;
        A = A + (1/p)*(s + z)*u_trans;
        s = -A*v;
        x_Broyden = x_Broyden + s;
        x_sol(:, k) = x_Broyden;
        if (max(abs(s)) < TOL)
            break
        end

    end

    x_sol = [x_0 x_sol];

end