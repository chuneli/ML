clear;
 load('Y.mat');
 [m1,m2,n]=size(Y);
 m=m1*m2;
 X=zeros(m,n);
 for i=1:n
     X(:,i)=reshape(Y(:,:,i),m,1);
 end
  
K=50;
bk=18*ones(1,K);
ak=2*ones(1,K);
MAXITER=100;
 [ U,V,betak ,keff] = ARDinNMF4KL( X,ak,bk ,MAXITER);
