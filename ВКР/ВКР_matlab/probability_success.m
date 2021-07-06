function P = probability_success(var,var1,var2)

im = wghts(var,var2);
worst = worst_case(var);
count = 1;
count_s = 1;
m =critical_path(var,var1,var2);
t_cp = max(m(:,1));
path_1 = fnd(m,2);
path_2 = fnd(m,3);
path=[path_1+path_2];
z =1.96;
data_sort = d_sort(var);
ds1 = data_sort(:,1);
ds2 = data_sort(:,2);
ds = [ds1+ds2];

while true
    
    if (path(count) == ds(count_s))
        sigma_sq_cp(count) = ((worst(count_s) - im(count_s))/6)^2;
        count = count + 1;
    else
        count_s = count_s + 1;
    end
    
    if count_s >= length(ds)
        sigma_sq_cp = sum(sigma_sq_cp);
        break;
    end
    
end


T = t_cp +z*sigma_sq_cp;
x = (T -t_cp)/(sqrt(sigma_sq_cp));
P =0.5 + 0.5*(erf(x)/sqrt(2));

end