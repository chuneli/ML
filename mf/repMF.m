
function [U,S,e,history]=repMF(Q,r,alpha)
[m,n]=size(Q); % m: number of users, n:number of services
q=2; % the dimension of latent space
U=rand(m,q); % initialize U,V with reandom value
S=rand(n,q);
lambdaU=0.1;
lambdaS=0.1;
maxIteration =100;
I=Q;
I(find(I))=1;
history=[];
for iter=1:maxIteration
     fprintf('iteration %d  ',iter);
    gradU=zeros(m,q);  % gradient
    for i=1:m %each user
        temSum=zeros(1,q);
        for j=1:n %each service
            temSum=temSum+ r(i) * I(i,j)*(Q(i,j)-U(i,:)*S(j,:)')*S(j,:);
        end  
        gradU(i,:)=lambdaU*U(i,:) -temSum;
    end
    
        gradS=zeros(n,q);  % gradient service 
    for j=1:n %each service
        temSum=zeros(1,q);
        for i=1:m %each user
            temSum=temSum+ r(i)* I(i,j)*(Q(i,j)-U(i,:)*S(j,:)')*U(i,:); 
        end  
        gradS(j,:)=lambdaS*S(j,:) -temSum;
    end
    
    for i=1:m % user
        U(i,:)=U(i,:)-alpha* gradU(i,:);
    end
    
    for j=1:n %
        S(j,:)=S(j,:)-alpha* gradS(j,:);
    end
    
    [ e ] = RMSE(Q,U,S);
    fprintf('rmse %f \n',e);
    history=[history;e];
end
  
end   
 
 
 