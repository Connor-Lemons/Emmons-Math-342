function [p_star_1, p_star_2] = quadForm1(a, b, c, n)
    
    a = round(a, n, "significant");
    b = round(b, n, "significant");
    c = round(c, n, "significant");

    p_star_1 = round(round(-b + round(sqrt(round(round(b^2, n, "significant") - round(round(4*a, n, "significant")*c, n, "significant"), n, "significant")), n, "significant"), n, "significant")/round(2*a, n, "significant"), n, "significant");
    p_star_2 = round(round(-b - round(sqrt(round(round(b^2, n, "significant") - round(round(4*a, n, "significant")*c, n, "significant"), n, "significant")), n, "significant"), n, "significant")/round(2*a, n, "significant"), n, "significant");

end