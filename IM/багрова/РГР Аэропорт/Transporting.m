function [] = Transporting()
    time_1 = round(1/30 * 60 * 60); % Время в пути между станциями
    time_2 = round((0.5 + 1 + 3)/30 * 60 * 60);
    time_3 = round((0.5 + 1 + 3)/30 * 60 * 60);

    time_now = 0; % Переменная для линии времени 
    
    time_next_1 = 0; % Время прибытия следующего в очередь
    time_next_2 = 0;
    time_next_3 = 0;
    
    queue_1 = []; % Очередь
    queue_2 = [];
    queue_3 = [];
    
    arrival_1 = -1; % Прибытие автобуса
    arrival_2 = -1;
    arrival_3 = 0;    
    
    near_1 = 0; % Время, проведенное автобусом около одной из остановок
    near_2 = 0;
    near_3 = 0;
    
    siting_time = round(Ravnomernoe(15, 25)); % Время на посадку и высадку пассажира
    leaving_time = 1;
    
    people_in_bus = 0; % Человек в автобусе
    
    while time_now < 7000
        % Пункт 1
        if time_now == time_next_1
            disp('- - - - - - ');
            time_next_1 = time_now + round(Pokazatelnoe(14/3600));
            disp('Человек прийдет в 1 автомат в ');
            disp(time_next_1);
            disp('- - - - - - ');
            queue_1 = New_queue(queue_1);
        end
        
        % Пункт 2
        if time_now == time_next_2
            time_next_2 = time_now + round(Pokazatelnoe(10/3600));
            queue_2 = New_queue(queue_2);
        end
        
        % Пункт 3
        if time_now == time_next_3
            time_next_3 = time_now + round(Pokazatelnoe(24/3600));
            queue_3 = New_queue(queue_3);
        end
        
        % Автобус приехал на пункт 1
        if (arrival_1 <= time_now) && (arrival_1 > -1) 
            if (near_1 < 5*60) && (people_in_bus < 20)
                near_1 = near_1 + 1;
                if (siting_time == 1)
                    disp('Сейчас момент времени');
                    disp(time_now);
                    disp('Очередь до удаления');
                    disp(queue_1);
                    siting_time = round(Ravnomernoe(15, 25));
                    queue_1 = Delete_person(queue_1);
                    disp('Очередь после удаления');
                    disp(queue_1);
                    disp('Следующего удалим через');
                    disp(siting_time);    
                    disp('- - - - - - ');
                end
                siting_time = siting_time - 1;
            else
                near_1 = 0;
                arrival_1 = -1;
                siting_time = round(Ravnomernoe(15, 25));
            end
            arrival_2 = time_now + time_1;
        end
        
        % Автобус приехал на пункт 2
        if (arrival_2 <= time_now) && (arrival_2 > -1)
            if near_2 < 5*60 && (people_in_bus < 20)
                near_2 = near_2 + 1;
                
            else
                near_2 = 0;
                arrival_2 = -1;
            end
            arrival_3 = time_now + time_2;
            siting_time = round(Ravnomernoe(15, 25));
        end
        
        % Автобус приехал на пункт 3
        if (arrival_3 <= time_now) && (arrival_3 > -1)
            if near_3 < 5*60 && (people_in_bus < 20)
                near_3 = near_3 + 1;
                
            else
                near_3 = 0;
                arrival_3 = -1;
            end
           arrival_1 = time_now + time_3;
           siting_time = round(Ravnomernoe(15, 25));
        end
        
        queue_1 = queue_1 + 1;
        queue_2 = queue_2 + 1;
        queue_3 = queue_3 + 1;
        time_now = time_now + 1;
    end
end