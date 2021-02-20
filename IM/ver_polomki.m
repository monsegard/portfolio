
function time_remonta = ver_polomki(n)
 
    v_polomki = rand(1,1);
        if n ==1
                if v_polomki >= 0.90
                    time_remonta = round(10*rand(1,1));
                else
                    time_remonta = 0;
                end
        else
                if v_polomki >= 0.95
                    time_remonta = round(10*rand(1,1));
                else
                    time_remonta = 0;
                end
                
        end
        
end