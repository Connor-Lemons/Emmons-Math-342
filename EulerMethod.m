function [t, w] = EulerMethod(f, a, b, N, alpha)

    syms t y

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for i = 1:N

        w(i+1) = w(i) + h*f(t(i), w(i));
        t(i+1) = a + i*h;

    end

end