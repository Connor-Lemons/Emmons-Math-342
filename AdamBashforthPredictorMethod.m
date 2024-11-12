function [t, w_4step] = AdamBashforthPredictorMethod(f, a, b, N, alpha)

    syms t y

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for i = 1:3
        
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i) + h/2, w(i) + K1/2);
        K3 = h*f(t(i) + h/2, w(i) + K2/2);
        K4 = h*f(t(i) + h, w(i) + K3);

        w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i+1) = a + i*h;

    end

    w_4step = w;

    for i = 4:N

        t(i+1) = a + i*h;

        w_temp = w_4step(i) + h*(55*f(t(i), w_4step(i)) - 59*f(t(i-1), w_4step(i-1)) + 37*f(t(i-2), w_4step(i-2)) - 9*f(t(i-3), w_4step(i-3)))/24;
        w_4step(i+1) = w_4step(i) + h*(9*f(t(i+1), w_temp) + 19*f(t(i), w_4step(i)) - 5*f(t(i-1), w_4step(i-1)) + f(t(i-2), w_4step(i-2)))/24;

    end

end