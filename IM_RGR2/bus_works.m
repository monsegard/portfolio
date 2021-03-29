function worktime_c = bus_works(t)

worktime =0;
count =0;
    while worktime < 480
        if(worktime + t > 480)
            break;
        end

        lunch =0;
            if(worktime >= 180)
                lunch = 60;
            end
        
        rest_a =round(xp_rasp(1/3)+10); 
        worktime = worktime + t*2 + rest_b() + rest_a + lunch;
        count = count + 1
        worktime_c(count,:)=[worktime,count]
    end
    
    
end