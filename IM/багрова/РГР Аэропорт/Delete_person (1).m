function new_queue = Delete_person(old_queue)
    if length(old_queue) == 1
        new_queue = [];
    else
        new_queue = zeros(1, length(old_queue) - 1);
        for i = 2:length(old_queue)
            new_queue(1, i - 1) = old_queue(1, i);
        end
    end
end