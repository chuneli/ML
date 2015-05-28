function  F=drawCont4TwoDimeGaus( mu,Sigma )
% 画图，二元高斯的概率密度函数的等高线平面图
%{
示例：
mu=[0 0];
Sigma=[1 0;0 1];
 drawCont4TwoDimeGaus( mu,Sigma );
%}

x1 = -3:.01:3;  
x2 = -3:.01:3;   
[X1,X2] = meshgrid(x1,x2); %生成了两个31*31的矩阵
F = mvnpdf([X1(:) X2(:)],mu,Sigma); %31*31个二维数据点 计算Multivariate normal probability density function 
F = reshape(F,length(x2),length(x1)); %向量转成矩阵

%画等高线
% contour(x1,x2,F,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
contour(x1,x2,F,0:0.01:1);
end

