function [t, w] = Heun(f, a, b, N, alpha)

    syms t y

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for i = 1:N

        
        
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i) + (1/3)*h, w(i) + (1/3)*K1);
        K3 = h*f(t(i) + (2/3)*h, w(i) + (2/3)*K2);

        w(i+1) = w(i) + (1/4)*(K1 + 3*K3);
        t(i+1) = a + i*h;

    end

end