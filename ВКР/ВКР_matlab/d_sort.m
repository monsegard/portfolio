function data_sort = d_sort(var)

m = importdata(var);

number_work = m(:,1);
support_work = m(:,2);
er_time = m(:,3);
lr_time = m(:,4);

count = 1;
count_s = 1;
count_len = 1;

len = length(number_work);
       
    while true
        
        while len >= count 

           if (number_work(count) == count_s)
               e = [number_work(count),support_work(count),er_time(count),lr_time(count)];
               data_sort(count_len,:) = [e];
               count_len = count_len + 1; 
               number_work(count) = 0;
           else
               count = count + 1;
           end

        end
        count_s = count_s + 1;
        count = 1;
        
        if count_len > len
            break;
        end
        
    end
end