function critical = zeros_critical(critical,fork)

count_d = length(critical);

while true
    if (count_d < sum(fork) + 1)
        critical(count_d + 1,:) =[0];
        count_d = count_d + 1;
        
    else
        break
    end
end
end