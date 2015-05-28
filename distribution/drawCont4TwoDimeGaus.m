function  F=drawCont4TwoDimeGaus( mu,Sigma )
% ��ͼ����Ԫ��˹�ĸ����ܶȺ����ĵȸ���ƽ��ͼ
%{
ʾ����
mu=[0 0];
Sigma=[1 0;0 1];
 drawCont4TwoDimeGaus( mu,Sigma );
%}

x1 = -3:.01:3;  
x2 = -3:.01:3;   
[X1,X2] = meshgrid(x1,x2); %����������31*31�ľ���
F = mvnpdf([X1(:) X2(:)],mu,Sigma); %31*31����ά���ݵ� ����Multivariate normal probability density function 
F = reshape(F,length(x2),length(x1)); %����ת�ɾ���

%���ȸ���
% contour(x1,x2,F,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
contour(x1,x2,F,0:0.01:1);
end

