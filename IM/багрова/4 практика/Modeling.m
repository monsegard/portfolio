function [sales, days_lack, details_need_mas] = Modeling(n)
days_lack = 0;
sales = zeros(1, n);
delivery_day = 0;
day = 0;
details_now = 10;
details_need = 0;
details_need_mas = [];
wait_delivery = false;
for day = 1:n
    if day == delivery_day
        details_now = details_now + 10;
        wait_delivery = false;
    end
    
    [details_need, lymbda] = Pyasson();
    details_need_mas(day) = details_need;
    
    if (details_now - details_need < 0) 
        days_lack = days_lack + 1;
        sales(1, day) = details_now;
    end

    if (details_now - details_need > 0) && (wait_delivery == false)
        details_now = details_now - details_need;
        sales(1, day) = details_now;
        if (details_now <= 6) && (mod(day, 5) == 0)
            wait_delivery = true;
            delivery_day = day + Days_delivery();
        end
    end
    
    if (details_now - details_need > 0) && (wait_delivery == true)
        details_now = details_now - details_need;
        sales(1, day) = details_now;
    end
   
end
end