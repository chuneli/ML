addpath('distribution'); 

% ��������㣬����Ŀ���t1 t2, һ��������и�basis��
% ����ֲ� p(t|x,alpha,beta)= N(0,C)��C=I/beta+ff'/alpha
% ��һ����alpha ����|C|����һ��

figure(1)
b=1;a=0;
C=[1,0;0,1];
mu=[0 0];
drawCont4TwoDimeGaus( mu,C );
drawSurf4TwoDimeGaus( mu,C );
figure(2)

a=1;
f=[1;2];
FF=f*f'; % 1 2 2 4
%  C1=[ 1/b+ 1/a  2/a; 2/a 1/b+4/a];
%  (1/b+1/a)(1/b+4/a)-4/a/a=1
%  (c+1)(c+4)=1+4
 c=solve('c^2+5*c-1=0')
b=1/c(1);
b=double(b);
C1=[ 1/b+ 1/a  2/a; 2/a 1/b+4/a];
drawCont4TwoDimeGaus( mu,C1 );
drawSurf4TwoDimeGaus( mu,C1 );
