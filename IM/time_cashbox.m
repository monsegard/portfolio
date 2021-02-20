
function service_time_f = time_cashbox(service_time_t)
sv = service_time_t;
service_time_f =0;
 while service_time_t > 0
     service_time_t = service_time_t - 1;
     polomka_1 = ver_polomki(1);
     polomka_2 = ver_polomki(2);
     if polomka_2 > 0
     service_time_t = sv;
     end
     service_time_f = polomka_1 + polomka_2 + 1 + service_time_f ;
     
 end
 
end