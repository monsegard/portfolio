function new_queue = New_queue(old_queue)
    new_queue = zeros(1, length(old_queue) + 1);
    for i = 1:length(old_queue)       
       new_queue(1, i) = old_queue(1, i);       
    end
    new_queue(1, length(old_queue) + 1) = 0;
end