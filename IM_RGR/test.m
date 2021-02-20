d = 0;
count = 0;
for n =1:100
    count = count + 1;
dm = drobilka();
    d = (dm(1) + d);
    dc = d / count;
    drobilka_otvet(count,:) = [round(dc)];
end
