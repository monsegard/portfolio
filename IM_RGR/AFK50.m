function time_p50 = AFK50(x)
    count = 0;
    pereezd50 = 3;

    for n = 1:3
        count = count + 1; 
        gryz50_pog = xp_rasp(x);
        s_gr50 = gryz50_pog + pereezd50;
        gr50(count,:) = [s_gr50]
        time_p50 = sort(gr50)
        
        

    end
end