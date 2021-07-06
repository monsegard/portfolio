function rasp = IM(var,var2)

data_sort = d_sort(var);
er_time = data_sort(:,3);
lr_time = data_sort(:,4);

% count = 1;
% a = 0;
% count_n = 0;
len = length(er_time);

    for i =1:var2
        for n=1:len
            if (lr_time(n)==0)
                rasp(n,i)=er_time(n);
                continue;
            else
                
                rasp(n,i) = unifrnd(er_time(n),lr_time(n));
%                 x = ((er_time(n) + lr_time(n))/2);
%                 ksi = rand (1,1);
%                 inter = (x * 2) ;
%                 rasp(n,i) = round(x + inter * (ksi - 0.5));
            end
        end
    end

% % while len >= count
% %     
% %     if (lr_time(count) == 0)
% %         t_avg(count,:) = [round(er_time(count))];
% %         count = count + 1;
% %         continue
% %     end
% %     
% %     x = ((er_time(count) + lr_time(count))/2);
% %     
% % %     for n =1:100
% % %         R=rand(1,1);
% % %         rasp = -1/x*log (R);
% % %         count_n = count_n + 1;
% % %         a = round(rasp + a);
% % %         ac = a / count_n;
% % %     end
% % 
% %     for n =1:1000
% %         ksi = rand (1,1);
% %         inter = (x * 2) ;
% %         rasp = round(x + inter * (ksi - 0.5));
% %         count_n = count_n + 1;
% %         a = rasp + a;
% %         ac = a / count_n;
% %     end
% %     
% %     a=0;
% %     count_n = 0;
% %     t_avg(count,:) = [ac];
% %     count = count + 1;
% %     
% % end

end