function [x] = Ravnomernoe (a, b)
    x_mean =  (a + b)/2;
    deilta_x = b - a;
    ksi = rand(1, 1);
    x = x_mean + deilta_x * (ksi - 0.5); 
end