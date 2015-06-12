load('data_sigma1.000000_n100000.mat'); %d=10,qtrue=4
q=8;
% T=T(1:20,:);

u=mean(T); %��N��С��ʱ����Ȼ��Ϊ0
for i=1:d
    T(:,i)=T(:,i)-u(i);
end

S = cov(T,1);  %% Sample variance
covytest = cov(Ttest,1);  %% cov֮ǰҪ��ȥ��ֵ�����Ŷ�
% [U,S,V ] = svds(covy,q ); %% ��һ����q������ֵ�� �������صĽ��S�о�û��q��
 [U,Lambda,V] = svd(S,'econ');  %% U=V
 % S�ж�û��q�� ά�ȸ���������q�� ˵����ʼ��������ֱ������ΪS�ĸ�����Ϊ��ʼ��
 
 
 qs=size(Lambda,1);
 if q>qs
     fprintf('qs=%f\n',qs);
     q=qs; 
 end
 
 [EV,Lambda2]=eig(S); %%lmbda2��˳����lambda����Lambda2��С��ǰ��EV������U�������Ҳ��˳��EV����Щ�еķ�����U��һ������ֵһ��
  sum(diag(S))
 sum(diag(Lambda))
 
 Lambda_q=Lambda(1:q,1:q);
 U_q=U(:,1:q);
 sigma2 =  ( sum(diag(Lambda)) -sum(diag( Lambda_q)) )/(d-q) ; 
 WWGamma=Lambda_q -sigma2*eye(q);
W=U_q *sqrt(WWGamma);

[n,d]=size(T);
[ntest,d]=size(Ttest);
C=W*W'+sigma2*eye(d);
det(C)
prodlambda=1;
for i=1:q
prodlambda=prodlambda*Lambda(i,i);
end
prod_lambda_q=prodlambda
prod_lambda_d=prod_lambda_q;
for i=(q+1):d
prod_lambda_d=prod_lambda_d*Lambda(i,i);
end
prod_lambda_d
prod_lambda_qsigma_d=prod_lambda_q;
for i=(q+1):d
prod_lambda_qsigma_d=prod_lambda_qsigma_d*sigma2;
end
prod_lambda_qsigma_d

[UC,LambdaC,VC]=svd(C);
[EVC,DC]=eig(C);

n*trace( inv(C)*S)   %%200
Y=T*UC;
TCX=Y.^2;
for i=1:q
    TCX(:,i)=TCX(:,i)/Lambda(i,i);
end
for i=(q+1):d
    TCX(:,i)=TCX(:,i)/sigma2;
end
sum(sum(TCX))
    

 L=-1/2*( d*log(2*pi)+ log(det(C)) + trace(inv(C)*S) );
Ltest=-1/2*( d*log(2*pi)+ log(det(C)) + trace(inv(C)*covytest) );
if ifn
L=n*L;
Ltest=ntest*Ltest;
end   

 p.sigma2=sigma2;
 p.W=W;
 p.L=L; 
 p.Ltest=Ltest;
 
 
 
 %%  find out the number of culumns from lambda
 x=diag(Lambda);
plot(x,'mx-','linewidth',3);
 for n=1:10
 for i=2:(length(x)-1)
     x(i)=16*x(i)+x(i-1)+x(i+1);
     x(i)=x(i)/18;
 end
 hold on;
 plot(x)
 end
 plot(x,'rx-','linewidth',3);
 
 
 x=diag(Lambda);
 [idx,c]=kmeans(x,2);
 
 x=diag(Lambda);
 z=linkage(x);
 cresult = cluster(z,'maxclust',9)
 
  x=diag(Lambda);
  x=x.^2;
 z=linkage(x);
 cresult = cluster(z,'maxclust',9)
 
  x=diag(Lambda);
  x=sqrt(x);
 z=linkage(x);
 cresult = cluster(z,'maxclust',9)
 
 x=sqrt(x);
  [idx,c]=kmeans(x,2);