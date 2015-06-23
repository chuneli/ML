 % investigate the relationship of C,S, estimated C for different given q 
 %% sampling
 n=10;
 d=3;
 q=1;
 stdvarn=2;
 [ T,W,X ] = pcaSample1( n,d,q, stdvarn );
 save('data3.mat');
 
 mu = mean(T);
T = T - repmat(mu, n, 1);

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

%% q=1
q=1;
 Uq = U(:, 1:q); %按特征值排序的特征向量
 Gammaq=diag(l(1:q));
 es1sigma2 = mean(l(q+1:end));
 es1W =  Uq * sqrt(   Gammaq-es1sigma2*eye(q)   );
es1C=es1W*es1W'+es1sigma2*eye(d);
es1C1= l(1)*U(:,1)*U(:,1)' -(l(2)+l(3))/2*U(:,1)*U(:,1)'+ (l(2)+l(3))/2*eye(3);

[es1V,es1G,es1Vrrr]=svd(es1C);
U*es1G*U'
es1V*es1G*es1V'
es1C
detEs1C=det(es1C);
detEs1C1=(l(2)+l(3))^2*l(1)/4;
traEs1C=trace(es1C);
traEs1C1=sum(l);
traEs1C2=trace(S);
invEs1C=inv(es1C);
invEs1C1= 1/detEs1C *( traEs1C*eye(3)- es1C);
es1CS=invEs1C*S;
es1CS1=U(:,1)*U(:,1)'*( 1-2*l(1)/(l(2)+l(3))) +2/(l(2)+l(3))*S;
traEs1CS=trace(es1CS);
traEs1CS1=(l(2)+l(3)-2*l(1))/(l(2)+l(3))*trace(U(:,1)*U(:,1)') +2*sum(l)/(l(2)+l(3));
likelihood1=log(det(es1C))+trace(inv(es1C)*S);
eslikelihood1=log( l(1)*(l(2)+l(3))*(l(2)+l(3))/4)+3;

%% 
q=2;
 Uq = U(:, 1:q); %按特征值排序的特征向量
 Gammaq=diag(l(1:q));
 es2sigma2 = mean(l(q+1:end));
 es2W =  Uq * sqrt(   Gammaq-es2sigma2*eye(q)   );
es2C=es2W*es2W'+es2sigma2*eye(d);
likelihood2=log(det(es2C))+trace(inv(es2C)*S);
eslikelihood2=log( prod(l))+3;

