function s = plot_inter(t_avg,t_alpha,disp_not_select,len)

interval_l = round(t_avg - t_alpha*(disp_not_select /sqrt(len)));
interval_r = round(t_avg + t_alpha*(disp_not_select /sqrt(len)));
x(1)=[interval_l];
tmp = (interval_l+interval_r)/2
x(2)=[tmp];
x(3)=[interval_r];

y=[0,1,0];
area(handles.axes2,x,y,'FaceColor','g','LineStyle',':')
ylim([0,2]);
xlim([interval_l,interval_r]);
 s = 1;
end