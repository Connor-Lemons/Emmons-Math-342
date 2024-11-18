function [t, w, h] = RKF45(f, a, b, alpha, TOL, hmax, hmin)

    syms t y

    t(1) = a;
    w(1) = alpha;
    h(1) = hmax;
    FLAG = 1;
    i = 1;

    while FLAG == 1

        K1 = h(i)*f(t(i), w(i));
        K2 = h(i)*f(t(i) + (1/4)*h(i), w(i) + K1/4);
        K3 = h(i)*f(t(i) + (3/8)*h(i), w(i) + (3/32)*K1 + (9/32)*K2);
        K4 = h(i)*f(t(i) + (12/13)*h(i), w(i) + (1932/2197)*K1 - (7200/2197)*K2 + (7296/2197)*K3);
        K5 = h(i)*f(t(i) + h(i), w(i) + (439/216)*K1 - 8*K2 + (3680/513)*K3 - (845/4104)*K4);
        K6 = h(i)*f(t(i) + (1/2)*h(i), w(i) - (8/27)*K1 +2*K2 - (3544/2565)*K3 + (1859/4104)*K4 - (11/40)*K5);

        R = (1/h(i))*abs((1/360)*K1 - (128/4275)*K3 - (2197/75240)*K4 + (1/50)*K5 +(2/55)*K6);

        if R < TOL
            t(i+1) = t(i) + h(i);
            w(i+1) = w(i) + (25/216)*K1 + (1408/2565)*K3 + (2197/4104)*K4 - (1/5)*K5;
        end

        delta = 0.84*(TOL/R)^(1/4);

        if delta <= 0.1
            h(i+1) = 0.1*h(i);
        elseif delta >= 4
            h(i+1) = 4*h(i);
        else
            h(i+1) = delta*h(i);
        end

        if h(i+1) > hmax
            h(i+1) = hmax;
        end

        if t(end) >= b
            FLAG = 0;
        elseif t(end) + h(i+1) > b
            h(i+1) = b - t(end);
        elseif h(i+1) < hmin
            disp("minimum h exceeded")
            return
        end

        i = i + 1;

    end
    h = [NaN h(1:end-1)];

end