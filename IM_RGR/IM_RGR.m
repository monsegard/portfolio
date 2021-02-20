%На данный момент реализована система с работай одного экскаватора и двумя 
%машинами так же посчитали сколько времени уходит на 1 цикл погрузки двух
%машина. Plain считает какой на данном цикле было ожидание погрузки 
%(если она вообще была), но не складывает в массив и нужно найти среднее

count = 0;
a = 0;
b = 0;
c = 0;
d = 0;
kol_vo = 100;
xmin = 0;
xmax = 110;

for n=1:kol_vo
    count = count + 1;
    
    am = ekskavator();
    a = am(1) + a;
    ac = a / count;
    eks_1(count,:) = [round(ac)];
    s_eks_1 = sum(eks_1 / kol_vo);
    
    bm = ekskavator();
    b = bm(1) + b;
    bc = b / count;
    eks_2(count,:) = [round(bc)];
    s_eks_2 = sum(eks_2 / kol_vo);

    cm = ekskavator();
    c = cm(1) + c;
    cc = c / count;
    eks_3(count,:) = [round(cc)];
    s_eks_3 = sum(eks_3 / kol_vo);
    
    dm = drobilka();
    d = (dm(1) + d);
    dc = d / count;
    drobilka_otvet(count,:) = [round(dc)];
    
    plot(eks_1,'marker','o','color', 'k')
    hold on
    plot(eks_2,'marker','o','color', 'g')
    plot(eks_3,'marker','o','color', 'b')
    plot(drobilka_otvet,'marker','x','color', 'r')
    xlim([xmin, xmax])
    xlabel('kol-vo testov')
    ylabel('downtime')
    title('  Dependence of profit on the number of cash registers')
    legend('ekskavator 1','ekskavator 2','ekskavator 3','drobilka')
    grid on
    hold off

end
ae =am(end);
de = dm(end);

percent_zagruzhennosti_drobilki = round((de * kol_vo)/480)
percent_zagruzhennosti_ekskavator = round((ae * kol_vo) / 480)
percent_service_gryzovik = round((((s_eks_1 + s_eks_2 + s_eks_3) / 3) * kol_vo)/480)