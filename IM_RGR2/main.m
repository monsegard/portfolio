
function arival_ab = main(t)

x = 1/11;
time_global =0;
time_working = 6;
time_hour =0;
count_t = 0;
count = 0;

while time_working < 24
    
    count = count + 1;
    
    if(t >=15)
        while true
            if(t > 60)
                t = t - 60;
                count_t = count_t + 1;
            else
                t = count_t + t/100
                break
            end
        end
    end
    
    if(time_working >= 7 && time_working < 10)
        x = 1/8;
    end
    if(time_working >= 10 && time_working < 16)
        x = 1/11;
    end
    if(time_working >= 16 && time_working < 19)
        x = 1/8;
    end
    if(time_working >= 19 && time_working > 24)
        x = 1/13;
    end;
    
    hour = round(xp_rasp(x));
    time_hour = time_hour + hour;
    
    if(time_hour >= 60)
        time_working = time_working + 1;
        time_hour = time_hour - 60;
    end
    
    arrival_a = time_working + (time_hour/100);
    arrival_b = t + time_working +(time_hour/100) + rest_b()/100;
    
    w = round(arrival_b)
    if(w > arrival_b)
        w = w-1;
        q = arrival_b - w
        if(q>=0.6)
            q=q-0.6
            q = 1+ q;
        end
        arrival_b = q + w
    end
    
    if(arrival_a >= 24 || arrival_b >= 24)
        break;
    else
        arival_ab(count,:) =[arrival_a,arrival_b,round(count)]
    end
    
end

end
