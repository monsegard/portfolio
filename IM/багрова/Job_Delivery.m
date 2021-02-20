function [detals, state, work, nowork, detals_spend, days_delivery]  = Job_Delivery(state, detals, work, nowork, days_delivery)
    if detals == 0
        nowork = nowork + 1;
        fprintf('Нет деталей\n');
        detals_spend = -1;
    else
        detals_spend = Pyasson();
        detals = detals - detals_spend;
        
        if detals == 0
            fprintf('День успешно отработал, но детали кончились\n');
            work = work + 1;
        elseif detals < 0
            fprintf('Не хватило деталей\n');
            detals = 0;
            nowork = nowork + 1;
        else
            fprintf('день отработан успешно, детали остались\n');
            work = work + 1;
        end
    end
    
    if days_delivery == 0
        days_delivery = -1;
        detals = detals + 10;
        state = 0;
        fprintf('Детали доставлены\n');
    else
        days_delivery = days_delivery - 1;
        fprintf('Дней до доставки\n');
    end


end






