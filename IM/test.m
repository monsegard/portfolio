count = 0;
a = 0;
for n = 1:100
count = count + 1;
a = round(cashbox_1() + a);
ac = a / count;
otvet_a(count,:) = [round(ac)];

end

    