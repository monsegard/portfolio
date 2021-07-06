function t_avg = worst_case(var)

datat_sort = d_sort(var);
er_time = datat_sort(:,3);
lr_time = datat_sort(:,4);

len = length(er_time);
count = 1;
count_t = 1;

while len >= count 
        if (lr_time(count)==0)
            t = er_time(count);
        else
            t = lr_time(count);
        end
        count = count + 1;
        t_avg(count_t,:)=[t];
        count_t = count_t + 1;
    end
    

end
