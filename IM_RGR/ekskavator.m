function gryz_waiting = ekskavator()
count = 0;
time_global = 0;
pereezd50 = 3;
comeback50 =2;
pereezd20 = 2.5;
comeback20 =1.5;
razn20 = 0;
razn50 = 0;
gryz20_pog = 0;
gryz_waiting_s = 0;
sum_zagr_eks = 0;
gryz_afk = 0;

while time_global <480
    if (time_global == 0)
        gryz50_pog = round(xp_rasp(1/10));
        time_global = gryz50_pog; 
        razn20 = time_global;
        zagr_eks = gryz50_pog;
    else

    razg20 = xp_rasp(1/2);
    razg50 = xp_rasp(1/4);
    gryz20_afk = pereezd20 + razg20 + comeback20 + razn20;
    gryz50_afk = pereezd50 + razg50 + comeback50 + razn50;

    if (gryz20_afk > gryz50_afk || time_global == 0)
        gryz50_pog = round(xp_rasp(1/10));
        pog_afk_50 = gryz50_pog + gryz50_afk;
        zagr_eks = gryz50_pog;
        if (pog_afk_50 <= gryz20_afk)
                        gryz20_afk = 0;
                        gryz_afk = gryz20_afk;
                        
                    else
                        razn20 = pog_afk_50 - gryz20_afk;
                        gryz_afk = razn20;
        end
    else
        gryz20_pog = round(xp_rasp(1/5));
        pog_afk_20 = gryz20_pog + gryz20_afk;
        zagr_eks = gryz20_pog;
        if (pog_afk_20 <= gryz50_afk)
                        gryz50_afk = 0;
%                         gryz20_pog_m(count,:) = [gryz20_pog];
                        gryz_afk = gryz50_afk;
                    else
                        razn50 = pog_afk_20 - gryz50_afk;
                        gryz_afk = razn50;
        end
        
    end
end
   count = count + 1; 
   time_global = time_global + gryz50_pog + gryz20_pog + gryz_afk;
   gryz_waiting_s = round(gryz_afk + gryz_waiting_s);
   sum_zagr_eks = sum_zagr_eks + zagr_eks;
end

    gryz_waiting(1,:) = [gryz_waiting_s ; sum_zagr_eks];
    
end