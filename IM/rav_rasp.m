function rrasp = rav_rasp(alpha)
ksi = rand (1,1);
inter = (alpha * 2) - 100;
rrasp = round(alpha + inter * (ksi - 0.5));
end