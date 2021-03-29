count =0;
kol_vo_route_t =0;
r=0;
t = 98
kol_vo = 50
% xmin = 0;
% xmax = 70;
% ymin = 470;
% ymax = 491;

for n =1:kol_vo
    count = count + 1;
    route = bus_works(t);
    rt = route(2)
    r =r + rt;
    rc = r/count;
    route_works(count,:) = [round(rc)];
    s_route_works = sum(route_works / kol_vo);
    
    kol_vo_route =route(end);
    kol_vo_route_t =kol_vo_route_t + kol_vo_route;
    kol_vo_route_d = kol_vo_route_t / count;
    
end

otvet = main(t)
route = route_works;
kol_vo_bus = otvet(end);

otvet_bus = round(kol_vo_bus /(kol_vo_route_d *3))
otvet_bus_driver = round(kol_vo_bus /(kol_vo_route_d))

plot(route,'marker','x','color','b')
%     xlim([xmin, xmax])
%     ylim([ymin,ymax])
    xlabel('kol-vo testov')
    ylabel('time')
    title('how long do drivers work on average')
    legend('work time avg')