function [t, w_2step, w_3step, w_4step, w_5step] = AdamBashforthMethod(f, a, b, N, alpha)

    syms t y

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for i = 1:4
        
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i) + h/2, w(i) + K1/2);
        K3 = h*f(t(i) + h/2, w(i) + K2/2);
        K4 = h*f(t(i) + h, w(i) + K3);

        w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i+1) = a + i*h;

    end

    w_2step = w;
    w_3step = w;
    w_4step = w;
    w_5step = w;

    for i = 2:N

        t(i+1) = a + i*h;
        w_2step(i+1) = w_2step(i) + h*(3*f(t(i), w_2step(i)) - f(t(i-1), w_2step(i-1)))/2;

    end

    for i = 3:N

        t(i+1) = a + i*h;
        w_3step(i+1) = w_3step(i) + h*(23*f(t(i), w_3step(i)) - 16*f(t(i-1), w_3step(i-1)) + 5*f(t(i-2), w_3step(i-2)))/12;

    end

    for i = 4:N

        t(i+1) = a + i*h;
        w_4step(i+1) = w_4step(i) + h*(55*f(t(i), w_4step(i)) - 59*f(t(i-1), w_4step(i-1)) + 37*f(t(i-2), w_4step(i-2)) - 9*f(t(i-3), w_4step(i-3)))/24;

    end

    for i = 5:N

        t(i+1) = a + i*h;
        w_5step(i+1) = w_5step(i) + h*(1901*f(t(i), w_5step(i)) - 2774*f(t(i-1), w_5step(i-1)) + 2616*f(t(i-2), w_5step(i-2)) - 1274*f(t(i-3), w_5step(i-3)) + 251*f(t(i-4), w_5step(i-4)))/720;

    end

end