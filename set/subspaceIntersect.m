% ��ͼ��Բ�������ߵĽ� ---generative����ķ���
t = 0:0.01:2*pi;
x = cos(t); y = sin(t);
fill(x,y,'r'); %������� �߽��ϵ�������(x,y)
hold on;
t = -1:0.01:1;
z = t.^2;
h=fill(t,z,'w');
set(h,'EdgeColor','w');
axis();
axis equal;

% ����27.6xy<6.17x+5.97y-27.6xy<1�ı߽��߼�����
 h1=ezplot('1-(6.17*x+5.97*y-27.6*x.*y)'); % ezplot������һ��Ҫ>0�Ķ���ʽ
hold on
h2=ezplot('6.17*x+5.97*y-27.6*x.*y-27.6*x.*y');
set(h1,'Color','blue')
set(h2,'Color','green')
[x,y]=meshgrid(-2*pi:pi/120:2*pi);
z1=1-(6.17*x+5.97*y-27.6*x.*y);
z2=6.17*x+5.97*y-27.6*x.*y-27.6*x.*y;
ind=(z1>=0&z2>=0);
h=plot(x(ind),y(ind),'.r','MarkerSize',2); %�ڿ������л�������

% |p(t)|<1,|t|<pi/2, p(t)=xcost+ycos 2t
t=-pi/3:.01:pi/3;
theta1=cos(t);
theta2=cos(2*t);
for i=1:length(theta1)
%     i=1;
s1=sprintf('1-%f*x-%f*y',theta1(i),theta2(i));
h1=ezplot(s1);
hold on;
s2=sprintf('%f*x+%f*y+1',theta1(i),theta2(i));
h2=ezplot(s2);
end


