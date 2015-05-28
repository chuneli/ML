function   drawSurf4TwoDimeGaus( mu,Sigma )
%画图 二元高斯分布的概率密度函数的立体图
%{
示例：
mu=[0 0];
Sigma=[1 0;0 1];
 drawSurf4TwoDimeGaus( mu,Sigma );
%}
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

end

