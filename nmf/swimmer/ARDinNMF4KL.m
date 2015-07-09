 function [ U,V,betak,keff ] = ARDinNMF4KL( X,ak,bk ,MAXITER)
%ARDINNMF4KL:  
%   DL(X,UV)
%   Uk; HN(0,1/betak)
%   Vk; HN(0,1/betak)
%   betak: Gamma(bk)

% X: the observed matrix, m times n
% ak,bk: fixed length-K hyperparameter determining the prior of betak

%{
 demo:

K=50;
bk=18*ones(1,K);
ak=0.9*ones(1,K);
MAXITER=100;
 [ U,V,betak ] = ARDinNMF4KL( X,ak,bk ,MAXITER)

%}

K=length(ak);
[m,n]=size(X);
a=mean(ak);
b=mean(bk);
L=(m+n+2*(a-1))/2/b;

% U=1/K*2*rand(m,K);
% V=1/K*2*rand(n,K);
U=rand(m,K);
V=rand(n,K);
betak=ones(1,K);
onemn=ones(m,n);
one1n=ones(1,n);
onem1=ones(m,1); 

for iter=1:MAXITER
    denominator=onemn'*U+V*diag(betak);
    right=(X./(U*V'))'*U;
    V=V./denominator.*right;
    
    denominator=onemn*V+U*diag(betak);
    right=X./(U*V')*V;
    U=U./denominator.*right;
    
    denominator=onem1'* (U.*U)+ one1n*(V.*V)+2*bk;
    betak=(m+n+2*(ak-1))./denominator;
    

    picn=5;
    if ~mod(iter,floor(MAXITER/picn))
        figure;
%         plot( betak,'.');
         plot(sort(betak),'.');
        hold on;
        plot(1:K,L*ones(1,K),'--g');
    end
end



figure;
        plot(sort(betak),'.');
        hold on;
        plot(1:K,L*ones(1,K),'--g');
epsilon=0.2*(max(betak)-min(betak));
keff=length(find(betak<L-epsilon ));

% end

