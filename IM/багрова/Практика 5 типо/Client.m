function client = Client()
    p = rand(1,1);
    if p <= 0.5
        client = 1;
    else
        client = 0;
    end
end