 T=[  1.1  3.1  5.3
     1 3 5
     0.9 2.9 4.9
     1.2 3 5.1
     1 3.2 5 
     1.1 2.8 5];
 [n,d]=size(T); %һ��һ�����ݵ�
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
  
  % s�ǶԳƷ���S1,S2,S3 ������һ���� S3��e-18���������ϲ�һ����
  
  
  
  
  %% S��SVD��eig
   [U,G,V]=svd(S1);  %S1=UGV'.G�Խǵģ��Ǹ��ģ��Ӵ�С���еġ�U����V����.U=V��
  [EV,E] = eig(S1);  % S1 EV=EV E�� Eò�ƴ�С�������еġ�
  [E, perm] = sort(diag(E), 'descend');
  E=diag(E);
  EV = EV(:, perm); % ��������ֵ����� ����ֵ������ֵһ��������������������������Ҫôһ��Ҫô������ȫ�෴��
 
 %T��SVD
 [U0,G0,V0] = svd(T,0);  %T=U0G0V0 T������������=S����������
  E0 = (1/n)*diag(G0).^2; 
  E0=diag(E0); %T������ֵ��ƽ��/n =S������ֵ
  
     