function rasp = disk_rasp()
gener_rasp = rand(1,1);
if (gener_rasp <= 0.1)
    rasp = 2;
elseif (gener_rasp <= 0.6)
    rasp = 3;
elseif (gener_rasp <= 0.9)
    rasp = 4;
else
    rasp = 5;
end