 
function [W, X, Trecon,negmseNew, mu, iter] = ppcaEM_noiseless(T, q)
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

% Initial (random) guess
W = rand(size(T, 1), q);

% Setup EM
converged = false;
negmseNew = -inf;
iter = 1;
while(~converged)
  negmseOld = negmseNew;

  %% E Step
  X = (W'*W) \ (W' * T);  % x|t的均值
  Trecon = W*X; % T=BX

  %% M step
  W = (T*X')/(X*X'); % T=BX的B
  negmseNew = -mean(  (  Trecon(:) - T(:) ).^2   ) ; %各点求差 平方 均值 mean square error

  % Check for convergence
  det=abs(negmseNew-negmseOld);
  avg=(abs(negmseNew) + abs(negmseOld) + eps)/2;
  if det/avg<1e-2
      converged = 1;
  end
  iter = iter + 1;
 
end % of EM

