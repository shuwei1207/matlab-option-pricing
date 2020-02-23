function out = blsvol(S,X,r,T,call)
minv = 0;
maxv = 1;
midv = (minv+maxv)/2;
while(abs(blscall(S,X,r,T,midv)-call)>=0.00001)
    if(blscall(S,X,r,T,midv)-call>0)
        maxv = midv;
    else
        minv = midv;
    end
    midv = (minv+maxv)/2;
end
out = midv;
