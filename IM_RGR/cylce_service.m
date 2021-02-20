function servise = cycle_service(x,y)

count = 0;
pereezd20 = 2.5;
pereezd50 = 3;

for n = 1:3
    count = count + 1;
    gryz20_pog = xp_rasp(x);
    s_gr20 = round(gryz20_pog + pereezd20);
    gr20(count,:) = [s_gr20];
end

count =0;

for n = 1:3
    count = count + 1;
    gryz50_pog = xp_rasp(y);
    s_gr50 = gryz50_pog + pereezd50;
    gr50(count,:) = [s_gr50];
    
     
     
end

d = [gr20;  gr50];
servise = sort(d);

end