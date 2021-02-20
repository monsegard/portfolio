function [] = Casses()
    time_now = 0;
    
    time_next = 0;
    time_enter = 0;
    time_service = 0;
    queue_fast = zeros(1, 1);
    queue_usual = zeros(1, 1);
    
%     fast_delay = 0;
%     usual_delay = 0;
%     people_fast = 0;
%     people_usual = 0;
    
    while time_now <= 4800
        % пришел клиент, сгенерировали время прихода и обcлуживания
        if time_now == time_next
            client = Client();
            if client == 0
                time_enter  = round(10 * Pokazatelnoe(11));
                time_service  = round(10 * Pokazatelnoe(9));
            else
                time_enter  = round(10 * Pokazatelnoe(21));
                time_service  = round(10 * Pokazatelnoe(20));
            end
            time_next = time_now + time_enter;
            
            
            % Пришедший клиент выбирает и встает в очередь 
            
            % Пришел быстрый клиент и обычная касса свободна
            if (client == 0) && (queue_usual(1, 1) == 0) 
                if queue_fast(1, 1) == 0
                    queue_fast(1, 1) =  time_service;
                else 
                    queue_usual(1, 1) = time_service;
                end    
            end
            % Пришел быстрый клиент и обычная касса занята
            if (client == 0) && (queue_usual(1, 1) > 0) 
                queue_fast = New_queue(queue_fast, time_service);
            end
            % Пришел обычный клиент и быстрая касса свободна
            if (client == 1) && (queue_fast(1, 1) == 0) 
                if queue_usual(1, 1) == 0
                    queue_usual(1, 1) =  time_service;
                else 
                    queue_fast(1, 1) = time_service;
                end    
            end
            % Пришел обычный клиент и быстрая касса занята
            if (client == 1) && (queue_fast(1, 1) > 0) 
                queue_usual = New_queue(queue_usual, time_service);
            end
        end
        % Уменьшаем время первого человека у кассы
        if queue_fast(1, 1) > 1
            queue_fast(1, 1) = queue_fast(1, 1) - 1;
        end
        if queue_usual(1, 1) > 1
            queue_usual(1, 1) = queue_usual(1, 1) - 1;
        end
        
        % Удаление людей из очереди
        if queue_fast(1, 1) == 1
            queue_fast = Delete_person(queue_fast);
        end
        if queue_usual(1, 1) == 1
            queue_usual = Delete_person(queue_usual);
        end
        
        % Переводы людей между очередями
        if (length(queue_fast) > 1) && (queue_usual(1, 1) == 0)
            queue_usual(1, 1) = queue_fast(1, 2);
            queue_fast = Delete_second(queue_fast);
        end
        if (length(queue_usual) > 1) && (queue_fast(1, 1) == 0)
            queue_fast(1, 1) = queue_usual(1, 2);
            queue_usual = Delete_second(queue_usual);
        end    
        
        %disp("Usual");
        %disp(queue_usual);
        %disp("Fast");
        %disp(queue_fast);
        time_now = time_now  + 1;     
    end
    disp(queue_usual);
    
    disp(queue_fast);

end