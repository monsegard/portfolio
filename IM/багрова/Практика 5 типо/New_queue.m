function new_queue = New_queue(old_queue, time_service)
    if old_queue(1, 1) > 0
        new_queue = zeros(1, length(old_queue) + 1);
        for i = 1:length(old_queue)       
           new_queue(1, i) = old_queue(1, i);       
        end
        new_queue(1, length(old_queue) + 1) = time_service;
    else
        new_queue(1, 1) = time_service;
    end
end