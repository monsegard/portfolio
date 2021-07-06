var = 'data1.csv';
var1= 1;
var2 =1000;
data_sort = d_sort(var);
er_time = data_sort(:,3);
lr_time = data_sort(:,4);

data_sort = d_sort(var);

number_work = data_sort(:,1);

count = 1;
count_len = 1;
len = length(number_work);
% tmp = 2;


% weights  = choose_path(var,var1,var2);
% data_sort=d_sort(var);
% number_work = data_sort(:,1);
% support_work = data_sort(:,2);
% % 
% % m = critical_path(var,var1,var2);
% % path_1 = m(:,2);
% % path_2 = m(:,3);
% % path=[path_1,path_2];
% % path(find(path==0))=[];
% G = digraph(number_work,support_work);
% e = plot(G,'EdgeLabel',weights,'Layout','layered','Direction','right');
% highlight(e,path,'EdgeColor','r','LineWidth',2);
% cp = max(m(:,1));

while true
    
    if (number_work(count) ==  number_work(count + 1))
        n = 1;
        fork(count_len,:)=[n];
%     elseif (number_work(count) == tmp)
%         n = 1;
%         fork(count_len,:)=[n];
    else
        n = 0;
        fork(count_len,:)=[n];
    end
    
%     tmp = number_work(count);
    count = count + 1;
    count_len = count_len + 1;
    
    if(count +1 > len)
        n = 1;
        fork(count_len,:)=[n];
        break;
    end
    
end



% t-критерий Стьюдента
% 0.95 = 0.975
% 0.90 = 0.95
% 0.99 = 0.995
t_alpha = tinv(0.995,23)
% % % % % 
% % % % % x=[30,33,37,41,44]
% % % % % y=[0,1,0,1,0,1]
% % % % % 
% % % % % q = IM(var,var2);
% % % % % tmp = q(:,1);
% % % % % len = length(tmp);
% % % % % for n =1: len 
% % % % % w=sum(q(n,:))/var2;
% % % % % we(n,:)=[w];
% % % % % end
% % % % % 
% % % % % t_avg = sum(we)/len;
% % % % % disp_select = round(sum(we.^2)/len);
% % % % % n =len/(len-1);
% % % % % disp_not_select =round(n*disp_select);
% % % % % CKO_not_select = sqrt(n * disp_select);
% % % % % CKO_select = sqrt(disp_select);
% % % % % t_alpha = tinv(0.975,len-1)
% % % % % interval_l = round(t_avg - t_alpha*(disp_not_select /sqrt(len)))
% % % % % interval_r = round(t_avg + t_alpha*(disp_not_select /sqrt(len)))


% % % e = IM(var,var1,var2)
% % % for n =1:17
% % %     
% % % m = e(n,:);
% % % cp = sum(m)/var2;
% % % weight(n,:) = [cp];
% % % 
% % % end


% % % % q = wghts(var,var1,var2);
% % % % t_avg = sum(q)/var2;
% % % % disp_select = round(sum(q.^2)/var2);
% % % % n =var2/(var2-1);
% % % % dsip_not_select =round(n*disp_select);
% % % % CKO_not_select = sqrt(n * disp_select)
% % % % CKO_select = sqrt(disp_select)


% len = length(answer);
% 
% for i =1:len
%     
%     w = sum(answer(i,:))/1000;
%     weights(i,:)=[w]
%     q = max(answer(:,i))
%     qw(i,:)=[q];
%     t = sum(qw)/1000;
% 
% end




% % % len = length(er_time)
% % %     for i =1:1000
% % %         
% % %         for n=1:len
% % %             if (lr_time(n)==0)
% % %                 rasp(n,i)=er_time(n);
% % %                 continue;
% % %             else
% % %                 x = ((er_time(n) + lr_time(n))/2);
% % %                 ksi = rand (1,1);
% % %                 inter = (x * 2) ;
% % %                 rasp(n,i) = round(x + inter * (ksi - 0.5));
% % %             end
% % %         end
% % %     end
% plot(rasp)
%         count_n = count_n + 1;
%         a = rasp + a;
%         ac = a / count_n;
        
        
%     end


% 
% weights  = choose_path(var,var1);
% data_sort = d_sort(var);
% 
% number_work = data_sort(:,1);
% support_work = data_sort(:,2);
% 
% i = 1;
% c = 0;
% brk =0;
% tmp =0;
% path_w = 0;
% count =1;
% count_s =1;
% count_len = 1;
% critial_tmp = 0;
% len = length(number_work);
% 
% for n =1:len
%     if(number_work(n) == 1)
%         i = i + 1;
%     end
%     
% end
% 
% number_wn = number_work;
% fork = search_fork(var);
% path_quantity =zeros(sum(fork)+1,1);
% 
% while true
%     
%     if support_work(count) == max(support_work)
%         
%         path_w = path_w + weights(count);
%         e = [number_work(count),support_work(count)];
%         c = c + 1;
%         data_tmp(c,:) = [e];
%         
%         if (path_w > critial_tmp)
%             data_critical = data_tmp;
%             critial_tmp = path_w;
%         end;
%         
%         critical(count_len,:)=[path_w];
%         count_len = count_len + 1;
%         number_work(transition) = 0;
%         
%         if tmp ==0
%             count = 1;
%         else
%             count = i;
%         end
%         
%         count_s = 1;
%         path_w = 0;
%         brk = brk + 1;
%         c = 0;
%         
%         x = [data_tmp];
%         x = zeros_data(x,fork);
%         if(length(x) > length(path_quantity))
%             path_quantity = zeros_data(path_quantity,fork);
%         end
%         path_quantity = [path_quantity,x];
%         
%         data_tmp = [];
% 
%         
%         if (brk == sum(fork))
%             data_critical = zeros_data(data_critical,fork);
%             critical = zeros_critical(critical,fork);
%             critical_path = [critical,data_critical,path_quantity];
%                 break;
%             end
%             
%         end
%     if (fork(count) ==0)
%         while true
%             if (support_work(count) == number_work(count_s))
%                 path_w = path_w + weights(count);
%                 e = [number_work(count),support_work(count)];
%                 c = c + 1;
%                 data_tmp(c,:) = [e];
%                 count = count_s;
%                 break;
%             else
%                 count_s = count_s + 1;
%                 
%                 if (count_s > len)
%                     number_wn(transition)=0;
%                     number_work = number_wn;
%                     number_work(transition)=0;
%                     i = i - 1;
%                     count = i;
%                     c = 0;
%                     data_tmp = [];
%                     tmp =1;
%                     count_s =1;
%                     path_w = 0;
%                     break;
%                 end
%                 
%             end
%         end
%     else
%         transition  =count;
%         while true
%             
%             
%             if (support_work(count) == number_work(count_s))
%                 path_w = path_w + weights(count);
%                 e = [number_work(count),support_work(count)];
%                 c = c + 1;
%                 data_tmp(c,:) = [e];
%                 count = count_s;
%                 break;
%             else
%                 count_s = count_s + 1;
%                 if (count_s > len)
%                     number_wn(transition)=0;
%                     number_work = number_wn;
%                     count = i;
%                     i = i - 1;
%                     count_s =1;
%                     path_w = 0;
%                     c = 0;
%                     data_tmp = [];
%                     break;
%                 end
%                 
%             end
%         end
%         
%     end
%     
% end