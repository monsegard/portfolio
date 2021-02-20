function n = Pyasson()
    mat_o = 0.3 * 0 + 1 * 0.36 + 2 * 0.22 + 3 * 0.09 + 4 * 0.03;
    disp = (0 - mat_o)^2 * 0.3 + (1 - mat_o)^2 * 0.36 + (2 - mat_o)^2 * 0.22 +(3 - mat_o)^2 * 0.09 + (4 - mat_o)^2 * 0.03;
    lymbda = (mat_o + disp)/2;
    sum = 0;
    m = 0;
    while true
        sum = sum - log(rand(1, 1));
        if (sum <= lymbda)
            m = m + 1;
        else
            break;
        end
    end  
    n = m;
end