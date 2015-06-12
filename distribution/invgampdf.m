function y = invgampdf(x,a,b)
%GAMPDF Inverse Gamma probability density function.


t1=b^a/gamma(a);
t2=x.^(-a-1);
t3=exp(-b./x);
y=t1*t2.*t3;

end
