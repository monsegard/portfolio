
C = [];
C = C';
a = 0;
b = 0;
c = 0;
d = 0;
e = 0;

count = 0;
xmin = 0;
xmax = 110;
ymin = 0;
ymax = 50000;
for n =1:100
    
count = count + 1;
a = round(cashbox_1() + a);
ac = a / count;
otvet_a(count,:) = [round(ac)];

b = round(cashbox_2() + b);
bc = b / count;
otvet_b(count,:) = [round(bc)];

c = round(cashbox_3() + c);
cc = c / count;
otvet_c(count,:) = [round(cc)];

d = round(cashbox_4() + d);
dc = d / count;
otvet_d(count,:) = [round(dc)];

e = round(cashbox_5() + e);
ec = e / count;
otvet_e(count,:) = [round(ec)];

% a(count,:) = [;cashbox_1()];
% b(count,:) = [;cashbox_2()];
% c(count,:) = [;cashbox_3()];
% d(count,:) = [;cashbox_4()];
% e(count,:) = [;cashbox_5()];

plot(otvet_a,'marker','+','color', 'g')
hold on
plot(otvet_b,'marker','o','color', 'g')
plot(otvet_c,'marker','*','color', 'b')
plot(otvet_d,'marker','d','color', 'm')
plot(otvet_e,'marker','v','color', 'r')
grid on
hold off
xlim([xmin, xmax])
ylim([ymin, ymax])
xlabel('kol-vo testov')
ylabel('PF')
title('  Dependence of profit on the number of cash registers')
legend('cashbox_1','cashbox_2','cashbox_3','cashbox_4','cashbox_5')
j=1;
end
