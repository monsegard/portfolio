function time_avg = choose_path(var,var1,var2)

if(var1 == 1)
    time_avg = worst_case(var);
else
    time_avg = wghts(var,var2);
end

end