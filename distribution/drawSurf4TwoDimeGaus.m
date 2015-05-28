function   drawSurf4TwoDimeGaus( mu,Sigma )
%��ͼ ��Ԫ��˹�ֲ��ĸ����ܶȺ���������ͼ
%{
ʾ����
mu=[0 0];
Sigma=[1 0;0 1];
 drawSurf4TwoDimeGaus( mu,Sigma );
%}
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

end

