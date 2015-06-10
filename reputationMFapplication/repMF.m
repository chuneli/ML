
function [U,S,rmse,history]=repMF(Q,r,alpha,q)
[m,n]=size(Q); % m: number of users, n:number of services
% q=2; % the dimension of latent space
U=rand(m,q); % initialize U,V with reandom value
S=rand(n,q);
lambdaU=0.1;
lambdaS=0.1;
maxIteration =1000;
I=Q;
I(find(I))=1;
history=[];
for iter=1:maxIteration
     fprintf('MF iteration %d  ',iter);
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
    
    [ rmse ] = RMSE(Q,U,S);
    history=[history;rmse];
    fprintf('rmse %f \n',rmse);
    
   if iter>5
     if abs(lastRMSE-rmse)<1e-5;  % if the rmse changes little, we stop before maxIteration
         fprintf ('break when the  diffence of rmse is %f\n',   abs(lastRMSE-rmse) );
         break;
     end
 end
  lastRMSE=rmse; % record this rmse to compare with the rmse going to get after the next iteration 
end
        

end
  

 
 