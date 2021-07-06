function s = fnd(m,x)

s = m(:,x);
s(find(s==0))=[];


end