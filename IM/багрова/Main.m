function detals = Main()
    n = 5;
    detals = 10;
    every_needs = 0;
    days_delivery = 0;
    detals_spend = 0;
    work = 0;
    nowork = 0;    
    state = 0; % state = 0  на склад не нужна поставка,работаем,
               % state = 1  на склад нужна поставка, работам,
               % state = 2  на склад нужна поставка, не работам.
    for week = 1:n
        fprintf('Week = \n', week);
        
        for days = 1:5
            fprintf('days = \n',days);
            
            if state == 0 
                every_needs = Pyasson();
                [detals, work, nowork] = Job(detals, every_needs, work, nowork);
                   
            elseif state == 1
                every_needs = Pyasson();
                if every_needs <= detals
                    detals = detals - every_needs;
                end              
            else
               [detals, state, work, nowork, detals_spend, days_delivery]  = Job_Delivery(state, detals, work, nowork, days_delivery);
                if detals_spend ~= 0
                    detalsspendcount = detalsspendcount + 1;
                end
                
            end                      
        end         
        if detals <= 6
            if state == 2
                [state, detals, days, nowork] = Delivery(state, detals, days, nowork);
                fprint('ƒней до доставки',days);
                days_delivery = days_delivery - 2;
                if detals > 0
                    state = 1;
                end           
            end
        end
    fprintf('–аботали',work);   
    fprintf('Ќе работали',nowork);
    end
end