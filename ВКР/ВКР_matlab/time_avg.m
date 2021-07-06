function t_avg = time_avg(var)
datat_sort = d_sort(var);

er_time = datat_sort(:,3);
lr_time = datat_sort(:,4);

count =1;
count_t =0;
len = length(er_time);

while len >= count 
    count_t = count_t + 1;
    if (er_time(count)==0)
        t = lr_time(count);
    else if (lr_time(count)==0)
            t = er_time(count);
        else
            t=(2 * er_time(count) + 3 * lr_time(count))/6
        end
    end
    count = count + 1;
    t_avg(count_t,:)=[t];
end
end