function data_critical = zeros_data(data_critical,fork)

count_d = length(data_critical);
while true
    if (count_d < sum(fork) + 1)
        data_critical(count_d + 1,:) =[0,0];
        count_d = count_d + 1;
        
    else
        break
    end
end

end