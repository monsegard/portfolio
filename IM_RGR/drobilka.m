function drobilka_z = drobilka()

time_global = 0;
pereezd50 = 3;
count = 0;
ii = 0;
gryz20_raz = 0;
gryz50_raz = 0;
gryz_afk = 0;
waiting_gryzoviki = 0;
zagr_drobilki = 0;

while time_global < 480
    count = count + 1;
    
    if time_global == 0
        gryz50_pog = round(xp_rasp(1/10));
        gryz50_gp = gryz50_pog + pereezd50;
        gryz50_raz = round(xp_rasp(1/4));
        time_global = gryz50_gp + gryz50_raz;
        raz_gryz = gryz50_raz;
    else

        
        for n=1:6
          afk50 =  round(AFK50(1/10)); 
          afk20_50 =round(cylce_service(1/5,1/10));
          
          if (ii == 3)
              ii = 1;
          else
              ii = ii + 1;
          end
          i = afk50(ii);
          
          x = afk20_50(n);
          if (x==i)
              q= round(xp_rasp(1/4));
              gryz50_raz = q + gryz_afk;
              gryz_afk = gryz20_raz;
              raz_gryz = q + raz_gryz;

          else
              w = round(xp_rasp(1/2));
              gryz20_raz = w + gryz_afk;
              gryz_afk = gryz20_raz;
              raz_gryz = w + raz_gryz;

          count = count + 1; 
          end
        end
        waiting_gryzoviki = gryz_afk + waiting_gryzoviki;
        zagr_drobilki = raz_gryz + zagr_drobilki;
       time_global = gryz50_raz + gryz20_raz + time_global;
    end
end

drobilka_z(1,:) =[waiting_gryzoviki ;zagr_drobilki];

end