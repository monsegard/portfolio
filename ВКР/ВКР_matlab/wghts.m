function weights = time_avg(var,var2)

e = IM(var,var2);
q = e(:,1);
len = length(q);

        for i = 1:len
            
        m = e(i,:);
        es = sum(m(1,:))/var2;
        weights(i,:) = [es];
        
        end
        
% % % tmp = w(1,:);
% % % len =length(tmp);
% % % for n = 1:len
% % %     
% % %     s = sum(w(:,n));
% % %     weights(n,:)=[s];
% % %     
% % % end

end