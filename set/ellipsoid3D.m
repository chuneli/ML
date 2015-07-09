xc=[ 0 0 0];
r=[1 2 3];
[x,y,z]=sphere; % 中心在0 半径为1的三维球
ellipsoidx=xc(1)+x*r(1);
ellipsoidy=xc(2)+y*r(2);
ellipsoidz=xc(3)+z*r(3);
mesh( ellipsoidx,ellipsoidy,ellipsoidz);
xlabel('x');
xlabel('y');
xlabel('z');
axis equal


% x y z 是什么 为什么是矩阵

eigvalue=r.^2;
G=diag(eigvalue);
U=eye(3);
P=U*G*inv(U);

m1=[0.8 0.2];
a1=[0.1 0.9];
a2=[0.9 0.1];
m1*a1'     %42
m1*a2'     %44 
a3=[0.05 0.95];
a4=[0.95 0.05];
m1*a3'     %54
m1*a4'     %56

exp( 3*m1*a1'-3)
exp( 3*m1*a2'-3)
exp( 3*m1*a3'-3)
exp( 3*m1*a4'-3)

