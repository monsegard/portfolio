function[state, detals, days, nowork]  = Delivery(state, detals, days, nowork)
    
    if days == -1 
        days = Days_delivery();
    elseif days == 0
        days = -1;
        detals = detals + 10;
        state = 0;
        fprintf('������ ����������');
    else
        days = days - 1;
        fprint('���� �� ��������:', days + 1);
    end
    
    nowork = nowork + 1;
end