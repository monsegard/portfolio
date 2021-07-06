% function op = optimization(var,var1)

var = 'meme.csv';
var1 = 1;

m = critical_path(var,var1)
path_1 = fnd(m,2);
path_2 = fnd(m,3);
path=[path_1+path_2];

cp = fnd(m,1);
len =length(cp);
for n = 1: len
reserve(n,:)  = [max(cp) - cp(n)]
end

% while true
%     
%     
%     
% end

s = size(m)
t = 4;
for n = 4:s-1
count = 1;
t = t + 1;
path_n = fnd(m,t);
t = t + 1;
path_np = fnd(m,t);
path_n=[path_n+path_np];
for a = 1:length(path_n)
    
    if(path(count) == path_n(count))
        m(count,n+1) =[0];
    end
    count = count + 1;
    
end

end

% end