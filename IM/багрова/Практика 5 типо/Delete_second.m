function new_queue = Delete_second(old_queue)
    if length(old_queue) == 2
        new_queue = zeros(1, 1);
        new_queue(1, 1) = old_queue(1, 1);
    else
        new_queue = zeros(1, length(old_queue) - 1);
        new_queue(1, 1) = old_queue(1, 1);
        for i = 3:length(old_queue)
            new_queue(1, i - 1) = old_queue(1, i);
        end     
    end
end