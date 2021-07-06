function cp =main(var,var1,var2);
%граф строит по данным из файла


weights  = choose_path(var,var1,var2);
data_sort=d_sort(var);
number_work = data_sort(:,1);
support_work = data_sort(:,2);
m = critical_path(var,var1,var2);
path_1 = m(:,2);
path_2 = m(:,3);
path=[path_1,path_2];
path(find(path==0))=[];
G = digraph(number_work,support_work);
e = plot(G,'EdgeLabel',weights,'Layout','layered','Direction','right');
highlight(e,path,'EdgeColor','r','LineWidth',2);
cp = max(m(:,1));
end




% labelnode(e,[1,2,3,4,5,6,7,8,9],{'И' '1' '2' '3' '4' '5' '6' '7' 'З'});
% grid on;
% figure;
% plot(G,'EdgeLabel',weights,'Layout','layered','Direction','right')
% grid on;