function days = Days_delivery()
    p = rand(1,1);
    if p <= 0.1
        days = 2;
    elseif p <= 0.6
        days = 3;
    elseif p <= 0.9
        days = 4;
    else days = 5;
    end
end