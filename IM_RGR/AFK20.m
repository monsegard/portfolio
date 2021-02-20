function time_p20 = AFK20(x)

    count = 0;
    pereezd20 = 2.5;

    for n = 1:3
        count = count + 1;
        gryz20_pog = xp_rasp(x);
        s_gr20 = round(gryz20_pog + pereezd20);
        gr20(count,:) = [s_gr20];
        time_p20 = sort(gr20)

    end

end