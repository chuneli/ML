
%% ��һԪ��˹����   
 x = (0:0.1:10)'; %xֵ
 y = gaussmf(x, [0.5 5]); %����ֵ ��׼���� ��ֵ
 plot(x,y)
 
 %% ����Ԫ��˹���� 
mu = [0 0]; %��ֵ����
Sigma = [.25 .3; .3 1]; %Э�������
x1 = -3:.2:3; %31����
x2 = -3:.2:3;  %31����
[X1,X2] = meshgrid(x1,x2); %����������31*31�ľ���
F = mvnpdf([X1(:) X2(:)],mu,Sigma); %31*31����ά���ݵ� ����Multivariate normal probability density function 
F = reshape(F,length(x2),length(x1)); %����ת�ɾ���
%������ͼ
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]); %���¸�������ɫ
axis([-3 3 -3 3 0 .4]); %��չ0���ʵ������ɫ���������
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
%���ȸ���
contour(x1,x2,F,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);


%%
mu=[0 0];
Sigma=[1 0;0 1];
Sigma=[0.6 0;0 0.6];
Sigma=[2 0;0 2];
Sigma=[2 0;0 1];
Sigma=[2 1;2 1];
 twoDimensionGaussianGird( mu,Sigma );
 F=twoDimensionGaussianContour( mu,Sigma );
 
 Sigma=[1 0.5;0.5 1];
  Sigma=[1 0.8;0.8 1];
  
Sigma=[1 -0.8;-0.8 1];

mu=[0 2];

mu=[1 2];
