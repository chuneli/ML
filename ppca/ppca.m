function [ W,sigma2 ,loglikelihood] = ppca( T,q )
%ppca Maximize the likelihood and give the results in explicit form
% T      - n*d - rows are examples, columns are features һ��һ�����ݵ� û�������ġ�����

[n,d]=size(T);
mu = mean(T);
T = T - repmat(mu, n, 1);
S=cov(T,1); % sample variance
[U,Gamma] = eig(S); %sample matrix������ֵ ��������
 [Gamma, perm] = sort(diag(Gamma), 'descend'); %��������ֵ����
 Uq = U(:, perm(1:q)); %������ֵ�������������
 Gammaq=diag(Gamma(1:q));
 sigma2 = mean(Gamma(q+1:end));
 W =  Uq * sqrt(   Gammaq-sigma2*eye(q)   );
 
   C=W*W'+sigma2*eye(d);
   loglikelihood=d*ln(2*pi)+ln(det(C))+trace(C\S);
   loglikelihood=-n/2*loglikelihood;
   
end

