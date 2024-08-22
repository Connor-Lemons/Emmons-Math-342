function [p_star_1, p_star_2] = quadForm2(a, b, c, n)

    a = round(a, n, "significant");
    b = round(b, n, "significant");
    c = round(c, n, "significant");

    p_star_1 = round(round(-2*c, n, "significant")/round(b + round(sqrt(round(round(b^2, n, "significant") - round(round(4*a, n, "significant")*c, n, "significant"), n, "significant")), n, "significant"), n, "significant"), n, "significant");
    p_star_2 = round(round(-2*c, n, "significant")/round(b - round(sqrt(round(round(b^2, n, "significant") - round(round(4*a, n, "significant")*c, n, "significant"), n, "significant")), n, "significant"), n, "significant"), n, "significant");

end