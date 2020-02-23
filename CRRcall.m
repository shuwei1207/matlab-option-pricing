function out = CRRcall(S,X,r,T,sigma,N)
dt = T/N;
u = exp(sigma*sqrt(dt));
d = 1/u;
p = (exp(r*dt)-d)/(u-d);
Stree = zeros(N+1);
Ptree = zeros(N+1);
Stree(1,1)=S;
for j = 2 : N+1
    Stree(1,j) = Stree(1,j-1)*u;
    for i = 2 : j
        Stree(i,j) = Stree(i-1,j-1)*d;
    end
end
Ptree(1,1) = 1;
for j = 2 : N+1
    Ptree(1,j) = Ptree(1,j-1)*p;
    for i = 2 : j-1
        Ptree(i,j) = Ptree(i-1,j-1)*(1-p)+Ptree(i,j-1)*p;
    end
    Ptree(j,j) = Ptree(j-1,j-1)*(1-p);
end
out = sum(max(Stree(:,N+1)-X,0).*Ptree(:,N+1))*exp(-r*T);