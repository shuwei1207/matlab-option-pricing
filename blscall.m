function out = blscall(S,X,r,T,sigma)
d1 = log(S/X) + ( r+0.5*sigma*sigma)*T/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);
out = S*normcdf(d1)-X*exp(-r*T)*normcdf(d2);