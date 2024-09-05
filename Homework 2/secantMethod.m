function [p, i] = secantMethod(f, p_0, p_1, TOL)
    
    q_0 = f(p_0);
    q_1 = f(p_1);

    fprintf("%-15s%-15s%-15s\n", "n", "p_n", "|p_n-p_{n-1}|")
    
    for i = 2:20
    
        p = p_1 - q_1*(p_1 - p_0)/(q_1 - q_0);

        print_i = vpa(i, 10);
        print_p = vpa(p, 10);
        diff_p = vpa(abs(p-p_1), 10);
    
        fprintf("%-15.7g%-15.7g%-15.7g\n", print_i, print_p, diff_p)
    
        if abs(p - p_1) < TOL
            break
        end
    
        p_0 = p_1;
        p_1 = p;
        q_0 = q_1;
        q_1 = f(p);
    
    end

    p = vpa(p);

end