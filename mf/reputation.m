function [ r ,A,history] = reputation( Q,d )
%calculate the reputation of users based on the rating matrix. It is
%measured by the difference between the user's rating and the average
%rating of services.
% Q: a full matrix, Q(user,service)=rating
%{ 

demo:
Q=[ 0 1 4 0; 2 0 4 1;1 1 0 5];
 d=0.1;
[ r ,A,history] = reputation( Q,d );

%}


[m,n]=size(Q); % m: number of users, n:number of services
r=ones(1,m); % repuatation for each user, initialized as one
A=zeros(1,n); % the average rating for each service over all the users that have rated it.
sizeI=zeros(1,n); % sizeI(j) denotes the number of users who have invoked service j
sizeO=zeros(1,m); % sizeO(i) denotes the number of services user i have invoked.
for j=1:n % each service
    sizeI(j)=length(nonzeros(Q(:,j)));  % the number of observed (nonzero) ratings for service j
end
for i=1:m % each user
    sizeO(i)=length(nonzeros(Q(i,:)));  % the number of observed (nonzero) ratings for service j
end

maxIteration=100;
history=[];
for iter=1:maxIteration
    fprintf('iteration %d\n', iter);
    for j=1:n % each service
        A(j)=Q(:,j)'*r'/sizeI(j); % the average of the ratings of service j, For unobsreved ones, q(i,j)=0, q(i,j)*r_i=0, it makes no effect on Q*r'
    end
    
    for i=1:m % each user
        sumDifference=0; % the sum of difference between ratings of services user i have given to the everages of these services
        for j=1:n %  each services
            if Q(i,j)~=0 % if service j is reted, i.e. sj is in Oi, the set of services user i has rated
%                j
                sumDifference=sumDifference+abs(Q(i,j)- A(j));
            end
        end
       r(i)=1- d*sumDifference/sizeO(i);
       
    end
 fprintf('r: ');   
 fprintf('%d ',r);
 fprintf('\n');
 history=[history;r]; % record r after each iteration
 
 if iter>5
     if sum(abs(lastR-r))<1e-5;  % if the r changes little, we stop before maxIteration
         fprintf ('break when the sum of r diffence is %f\n',  sum(abs(lastR-r)));
         break;
     end
 end
  lastR=r; % record this r to compare with the r going to get after the next iteration 
end

end

 