function [ T,W,X ] = pcaSample1( n,d,q, stdvarn )
%PCASAMPLE 
% stdvarn:W���еı�׼����
% noise: variance=1

W=zeros(d,q);
for i=1:q
   W(:,i) = normrnd(0,stdvarn(i),d,1); % multivariate normal distribution.
end
X=randn(q,n); % standard normal distribution
epsilon=randn(d,n); % noise, variance=1, standard normal distribution
T=W*X+epsilon;
T=T'; % nxd
end

