function [detals, work, nowork] = Job(detals, every_needs, work, nowork)
    if detals == 0
        nowork = nowork + 1;
        fprintf('Деталей нет');
        return
    end
    detals = detals - every_needs; 
    if detals == 0
        work = work + 1;
        fprintf('Детали закончились, нужна поставка');
        return
    end
    
    if detals < 0
        nowork = nowork +1;
        fprintf('Не хватило деталей');
        return
    end
    
    work = work + 1;
end