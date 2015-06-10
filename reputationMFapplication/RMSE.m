function [ e ] = RMSE(Q,U,S)
I=Q;
I(find(I))=1;
sizeQ=sum(sum(I)); % the number of observed rating
 esQ=U*S';
 diQ=Q-esQ;
e= sum(sum(I.* diQ.^2)); % only evaluate on the observed Q
e=sqrt(e/sizeQ);
end
