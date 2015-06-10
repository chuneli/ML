 T=[  1.1  3.1  5.3
     1 3 5
     0.9 2.9 4.9
     1.2 3 5.1
     1 3.2 5 
     1.1 2.8 5];
 [n,d]=size(T); %一行一个数据点
mu = mean(T);
T = T - repmat(mu, n, 1);

 %% sample matrix 
 
 S1=zeros(d,d);
  for i=1:n
%       t=T(i,:);
%       t=t';
%       S1=t*t'+S1;
        S1=S1+ T(i,:)'*T(i,:);
  end
  S1=S1/n;
  
  S2=T'*T/n;
  
  S3=cov(T,1); 
  
  % s是对称方阵。S1,S2,S3 基本是一样的 S3在e-18的数量级上不一样了
  
  
  
  
  %% S的SVD与eig
   [U,G,V]=svd(S1);  %S1=UGV'.G对角的，非负的，从大到小排列的。U正交V正交.U=V。
  [EV,E] = eig(S1);  % S1 EV=EV E。 E貌似从小到大排列的。
  [E, perm] = sort(diag(E), 'descend');
  E=diag(E);
  EV = EV(:, perm); % 按照特征值排序后 特征值与奇异值一样。特征向量与奇异向量的列要么一样要么符号完全相反。
 
 %T的SVD
 [U0,G0,V0] = svd(T,0);  %T=U0G0V0 T的右奇异向量=S的特征向量
  E0 = (1/n)*diag(G0).^2; 
  E0=diag(E0); %T的奇异值的平方/n =S的特征值
  
     