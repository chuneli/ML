 %% sampling
 n=10;
 d=3;
 q=1;
 stdvarn=2;
 [ T,W,X ] = pcaSample1( n,d,q, stdvarn );
 save('data3.mat');
 
 %% C S
 WW=W*W';
 C=WW+eye(3); % noise variance sigma2=1;
 [V,G,Vrrr]=svd(C); %特征值就是奇异值
 lambda=diag(G);

 S=T'*T/n;
 [U,L,Urrr]=svd(S);
 l=diag(L);
 
 %% invC
  invC=inv(C);
 invC1=V*diag(1./lambda)*V';
 
 %% detc
 detc=det(C);
 detc1=prod(lambda);
 
 %% sum tC^-1 t
 sumtct=0;
 for i=1:n
     sumtct=sumtct+T(i,:)*invC*T(i,:)';
 end
 
sumtct1= n*trace(invC*S);

%% 
q=1;
 Uq = U(:, 1:q); %按特征值排序的特征向量
 Gammaq=diag(l(1:q));
 es1sigma2 = mean(l(q+1:end));
 es1W =  Uq * sqrt(   Gammaq-es1sigma2*eye(q)   );
es1C=es1W*es1W'+es1sigma2*eye(d);
[es1V,es1G,es1Vrrr]=svd(es1C);

detes1C=det(es1C);
detes1C1=(l(2)+l(3))^2*l(1)/4;


CS=invC*S;
SdG=diag(1./lambda)*S;
CS1=V*SdG*V';

t=T(1,:);
t=t';
t'*inv(C)*t
t(1)*t(1)/lambda(1)+t(2)*t(2)/lambda(2)+ t(3)*t(3)/lambda(3)

 sumtct2=0;
 for i=1:n
     t=T(i,:);
     t2=t.^2;
     sumtct2=sum(t2./lambda')+sumtct2;
 end
 
 sumtct3=n*sum(l./lambda);
 
  
q=8;
% T=T(1:20,:);

u=mean(T); %当N很小的时候显然不为0
for i=1:d
    T(:,i)=T(:,i)-u(i);
end

S = cov(T,1);  %% Sample variance
covytest = cov(Ttest,1);  %% cov之前要减去均值向量才对
% [U,S,V ] = svds(covy,q ); %% 不一定有q个奇异值啊 这样返回的结果S中就没有q长
 [U,Lambda,V] = svd(S,'econ');  %% U=V
 % S中都没有q个 维度更不可能是q了 说明初始化不合理，直接让其为S的个数作为初始化
 
 
 qs=size(Lambda,1);
 if q>qs
     fprintf('qs=%f\n',qs);
     q=qs; 
 end
 
 [EV,Lambda2]=eig(S); %%lmbda2的顺序与lambda反了Lambda2是小在前，EV的列与U的列因此也反顺序，EV的有些列的符号与U不一样，数值一样
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