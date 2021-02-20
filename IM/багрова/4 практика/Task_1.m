function[] = Task_1(n)
x_aver = 0;
x_aver_kv = 0;
dispersion = 0;
proverka_s = [];
s = 0;
veroyatnost = [];
[sales, days_lack, details_need_mas] = Modeling(n);
x = [];
sort = zeros(1, 5);
sort_it = [];
for i = 1:n
    x(i) = i;
end
fprintf('Дни, когда не работали:')
disp(days_lack);
plot(x, sales);

x_aver = sum(details_need_mas)/n;
fprintf('Оценка среднего:')
disp(x_aver);

for i = 1:n
    s = s + details_need_mas(i)*details_need_mas(i);
end
x_aver_kv = s/n;
dispersion = (n/(n-1))*(x_aver_kv - x_aver*x_aver);
fprintf('Несмещенная оценка дисперсии:')
disp(dispersion);

%hold on
for i = 1:n
    if details_need_mas(i) == 0
        sort(1) = sort(1) + 1;
    elseif details_need_mas(i) == 1
        sort(2) = sort(2) + 1;
    elseif details_need_mas(i) == 2
        sort(3) = sort(3) + 1;
    elseif details_need_mas(i) == 3
        sort(4) = sort(4) + 1;
    else sort(5) = sort(5) + 1;
    end
end
for i = 1:5
    sort_it(i) = sort(i)/5;
end
    
veroyatnost(1) = (x_aver^(i-1)/factorial(i))*exp(-x_aver);
for i = 2:5
    veroyatnost(i) = (x_aver^(i)/factorial(i))*exp(-x_aver);
    proverka_s(i) = ((details_need_mas(i) - n * veroyatnost(i))^2)/(n * veroyatnost(i));
end
fprintf('Критическое значение:')
disp(sum(proverka_s)); 

teor = chi2inv(0.95, n - 1);
fprintf('Теоретичесоке значение:')
disp(teor);
if sum(proverka_s) < teor 
    disp('Данные имеют распределение Пуассона');
else
    disp('Данные не имеют распределение Пуассона');
end

end
