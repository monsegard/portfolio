
function pf_avg = cashbox_1()

time_global = 0;
count = 0;
revenue = 0;
waiting_time = 0;
service_time_last_1 = 0;
kolvo_cashbox = 1;


while time_global < 480
    rasp = round(xp_rasp(1/7));
    time_global = time_global + rasp + waiting_time;
    count = count+1;
    service_time_t = round(xp_rasp(1/9)+waiting_time);
    supply = rav_rasp(1000);
    service_time_f = time_cashbox(service_time_t);

if service_time_f >= service_time_last_1
    money_buyer = rav_rasp(500);
    service_time_last_1 = service_time_t;
else
    waiting_time = service_time_last_1 - service_time_f;
    money_buyer = rav_rasp(500);
    service_time_last_1 = service_time_t;            
end

    revenue = (money_buyer + revenue);
    pf = revenue - supply*kolvo_cashbox;
   
end

end