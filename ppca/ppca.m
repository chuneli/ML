function [ W,sigma2 ,loglikelihood] = ppca( T,q )
%ppca Maximize the likelihood and give the results in explicit form
% T      - n*d - rows are examples, columns are features 一行一个数据点 没有噪声的。。。

[n,d]=size(T);
mu = mean(T);
T = T - repmat(mu, n, 1);
S=cov(T,1); % sample variance
[U,Gamma] = eig(S); %sample matrix的特征值 特征向量
 [Gamma, perm] = sort(diag(Gamma), 'descend'); %按照特征值排序
 Uq = U(:, perm(1:q)); %按特征值排序的特征向量
 Gammaq=diag(Gamma(1:q));
 sigma2 = mean(Gamma(q+1:end));
 W =  Uq * sqrt(   Gammaq-sigma2*eye(q)   );
 
   C=W*W'+sigma2*eye(d);
   loglikelihood=d*ln(2*pi)+ln(det(C))+trace(C\S);
   loglikelihood=-n/2*loglikelihood;
   
end

