function path =temp(number_work, support_work,count,count_s,len)
weights = time_avg();
path =0;


        while true
            
            transition  =count;
            if (support_work(count) == number_work(count_s))
                path = path + weights(count);
                count = count_s;
                
                break;
            else
                count_s = count_s + 1;
                if (count_s > len)
                    number_work = number_wn;
                    number_work(transition)=0;
                    count = 1;
                    count_s =1;
                    path = 0;
                    break;
                end
                
            end
        end

end