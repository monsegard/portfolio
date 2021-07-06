function critical_path = critical_path(var,var1,var2)

data_sort = d_sort(var);
weights  = choose_path(var,var1,var2);
number_work = data_sort(:,1);
support_work = data_sort(:,2);

len = length(number_work);
% e = IM(var,var1,var2)

% for n =1:len
%     
% m = e(n,:);
% cp = sum(m)/var2;
% weights(n,:) = [cp];
% end

i = 1;
c = 0;
brk =0;
tmp =0;
path_w = 0;
count =1;
count_s =1;
count_len = 1;
critial_tmp = 0;


for n =1:len
    if(number_work(n) == 1)
        i = i + 1;
    end
    
end

number_wn = number_work;
fork = search_fork(var);
path_quantity =zeros(sum(fork)+1,1);

while true
    
    if support_work(count) == max(support_work)
        
        path_w = path_w + weights(count);
        e = [number_work(count),support_work(count)];
        c = c + 1;
        data_tmp(c,:) = [e];
        
        if (path_w > critial_tmp)
            data_critical = data_tmp;
            critial_tmp = path_w;
        end;
        
        critical(count_len,:)=[path_w];
        count_len = count_len + 1;
        number_work(transition) = 0;
        
        if tmp ==0
            count = 1;
        else
            count = i;
        end
        
        count_s = 1;
        path_w = 0;
        brk = brk + 1;
        c = 0;
        
        x = [data_tmp];
        x = zeros_data(x,fork);
        if(length(x) > length(path_quantity))
            path_quantity = zeros_data(path_quantity,fork);
        end
        path_quantity = [path_quantity,x];
        
        data_tmp = [];

        
        if (brk == sum(fork))
            data_critical = zeros_data(data_critical,fork);
            critical = zeros_critical(critical,fork);
            critical_path = [critical,data_critical];
                break;
            end
            
        end
    if (fork(count) ==0)
        while true
            if (support_work(count) == number_work(count_s))
                path_w = path_w + weights(count);
                e = [number_work(count),support_work(count)];
                c = c + 1;
                data_tmp(c,:) = [e];
                count = count_s;
                break;
            else
                count_s = count_s + 1;
                
                if (count_s > len)
                    number_wn(transition)=0;
                    number_work = number_wn;
                    number_work(transition)=0;
                    i = i - 1;
                    count = i;
                    c = 0;
                    data_tmp = [];
                    tmp =1;
                    count_s =1;
                    path_w = 0;
                    break;
                end
                
            end
        end
    else
        while true
            
            transition  =count;
            if (support_work(count) == number_work(count_s))
                path_w = path_w + weights(count);
                e = [number_work(count),support_work(count)];
                c = c + 1;
                data_tmp(c,:) = [e];
                count = count_s;
                break;
            else
                count_s = count_s + 1;
                if (count_s > len)
                    number_wn(transition)=0;
                    number_work = number_wn;
                    count = i;
                    i = i - 1;
                    count_s =1;
                    path_w = 0;
                    c = 0;
                    data_tmp = [];
                    break;
                end
                
            end
        end
        
    end
    
end

end




