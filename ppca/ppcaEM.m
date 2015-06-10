 
function [W,loglikelihood, X, Trecon,negmseNew, mu, iter] = ppcaEM(T, q)
%% Principal component analysis using EM
%
%% Inputs
% T      - n*d - rows are examples, columns are features 一行一个数据点 没有噪声的。。。
%
% If k is not specified, we use the maximum possible value (rank(X))
%% Outputs
% W      -  d*k (the basis vectors)
% Z      -  n*k (the principal components)
% evals  -  the eigenvalues
% Xrecon -  n*d - reconstructed from first K
% mu     -  d*1

n = size(T, 1); % the number of data points
if nargin < 2
q = rank(T);   % 初始化q
end

mu = mean(T);
T = T - repmat(mu, n, 1);
T = T'; % each *column* is now a centered data case 一列一个数据点
S=zeros(d,d);
  for i=1:n
      S=T(:,i)*T(:,i)'+S;
  end
  S=S/n;
% Initial (random) guess
negmseNew = -inf;
newW = rand(size(T, 1), q);
newSigma2=1;

% Setup EM
converged = false;
iter = 1;
while(~converged)
  negmseOld = negmseNew;
  W=newW;
  sigma2=newSigma2;
  C=W*W'+sigma2*eye(d);
   loglikelihood=d*ln(2*pi)+ln(det(C))+trace(C\S);
   loglikelihood=-n/2*loglikelihood;
  %% E Step
  X = (sigma2*eye(q)+ W'*W) \ (W' * T);  % x|t的均值
  Trecon = W*X;  %?????
  negmseNew = -mean(  (  Trecon(:) - T(:) ).^2   ) ; %各点求差 平方 均值 mean square error

  %% M step
  
  M=sigma2*eye(q)+W'*W;
  newW=S*W/( sigma2*eye(q)+ M\(W'*S*W) );
  newSigma2=trace( S- ((S*W)/M)*newW'  )/d;
   
 
      
  % Check for convergence
  det=abs(negmseNew-negmseOld);
  avg=(abs(negmseNew) + abs(negmseOld) + eps)/2;
  if det/avg<1e-2
      converged = 1;
  end
  iter = iter + 1;
 
  
  
end % of EM

