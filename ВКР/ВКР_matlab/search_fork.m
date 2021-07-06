function fork = search_fork(var)

data_sort = d_sort(var);

number_work = data_sort(:,1);

count = 1;
count_len = 1;
len = length(number_work);
% tmp = 2;

while true
    
    if (number_work(count) ==  number_work(count + 1))
        n = 1;
        fork(count_len,:)=[n];
    else
        n = 0;
        fork(count_len,:)=[n];
    end
  
    count = count + 1;
    count_len = count_len + 1;
    
    if(count +1 > len)
        n = 1;
        fork(count_len,:)=[n];
        break;
    end
    
end

end