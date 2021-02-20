%Неделя начинается с понедельника поэтому r_day = 1
r_day = 1;
detali = 10;
nedel = 1;
count = 0;
dostavka = 0;
day_dostavki = 0;
xmin = 1;
xmax = 26;
ymin = 0;
ymax = 15;
nexvatka_day = 0;
sum_detali = 0;
detali_mi = 0;
zapas_mi = 0;

while r_day <= 5 * nedel
    
    if day_dostavki == r_day;
        detali = 10 ;
        
        
    end
    
    count = count + 1;
    potreb = Pyasson();
    
    if detali >= potreb
        detali = detali - potreb;
        zapas (count,:) = [detali];
        
    else
        for n =1:potreb
            if detali == 0
                nexvatka_day = nexvatka_day + 1;
                stop(count,:)=[,15];
                break;
            end
            detali = detali - 1;
            
        end
        zapas (count,:) = [detali];
        
    end
    
    if (r_day == 5 * nedel) && (detali <= 6)
        dostavka = disk_rasp();
        day_dostavki = r_day + dostavka;
        sum_detali = 10*nedel;
        if detali >0
            detali_mi(count,:) = [10 + detali];
            
            if nedel == 1
                detali_mi(1,:) = [10 - detali];
            else
                detali_mi(1,:) =[10];
            end
        else
            detali_mi(count,:) =[10];
        end
    end

    detali_sqrt = sum_detali^2;
    
    if (nedel < 5) && (r_day == 5 * nedel)
        nedel = nedel + 1;
    end

   
    
     r_day = r_day + 1;
    
end

% Выборочное среднее
avg =  sum_detali/count;
% Выброчная дисперсяи
vib_disp =((detali_sqrt) / count) - avg^2;
% Несмещённая дисперсия
nesmechn_dispersion = (count / (count - 1)) * (vib_disp - avg * avg);
% хи^2 теоретическая
xi_teor = chi2inv(0.95, count - 1);
% хи^2 эксп
xi = 1/count *sum((detali_mi(1)-count*0.1) +(detali_mi(5)-count*0.1)+ (detali_mi(10)-count*0.1)+(detali_mi(15)-count*0.1)+(detali_mi(20)-count*0.1));
if xi < xi_teor
    disp('Нет основания отклонять гипотезу следовательно H0')
else
    disp('Есть основанияотклонять данную гипотезу следовательно H1')
end

disp('nexvatka_day: ')
disp(nexvatka_day)
bar (zapas);
hold on
bar(stop,'r')
grid on
hold off
xlim([xmin, xmax])
ylim([ymin, ymax])
xlabel('rab day')
ylabel('detali')
title('  inventory level')
legend('zapas detai','detale=0')




