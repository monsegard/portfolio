function [detals, state, work, nowork, detals_spend, days_delivery]  = Job_Delivery(state, detals, work, nowork, days_delivery)
    if detals == 0
        nowork = nowork + 1;
        fprintf('��� �������\n');
        detals_spend = -1;
    else
        detals_spend = Pyasson();
        detals = detals - detals_spend;
        
        if detals == 0
            fprintf('���� ������� ���������, �� ������ ���������\n');
            work = work + 1;
        elseif detals < 0
            fprintf('�� ������� �������\n');
            detals = 0;
            nowork = nowork + 1;
        else
            fprintf('���� ��������� �������, ������ ��������\n');
            work = work + 1;
        end
    end
    
    if days_delivery == 0
        days_delivery = -1;
        detals = detals + 10;
        state = 0;
        fprintf('������ ����������\n');
    else
        days_delivery = days_delivery - 1;
        fprintf('���� �� ��������\n');
    end


end






