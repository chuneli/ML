
%% 画一元高斯曲线   
 x = (0:0.1:10)'; %x值
 y = gaussmf(x, [0.5 5]); %概率值 标准方差 均值
 plot(x,y)
 
 %% 画二元高斯曲面 
mu = [0 0]; %均值向量
Sigma = [.25 .3; .3 1]; %协方差矩阵
x1 = -3:.2:3; %31个点
x2 = -3:.2:3;  %31个点
[X1,X2] = meshgrid(x1,x2); %生成了两个31*31的矩阵
F = mvnpdf([X1(:) X2(:)],mu,Sigma); %31*31个二维数据点 计算Multivariate normal probability density function 
F = reshape(F,length(x2),length(x1)); %向量转成矩阵
%画曲面图
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]); %重新给曲面着色
axis([-3 3 -3 3 0 .4]); %扩展0概率底面的着色到坐标点轴
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
%画等高线
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
