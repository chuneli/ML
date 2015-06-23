 importfile('tensor1.txt');
t=tensor1;
 [v,uqx,uqy,uqz]=index2tensor(t);
%% 
lambda=0.1;  % mean+lambda*std
for count=1:4
[newv,newx,newy,newz]=extend3v(v,uqx, uqy, uqz,lambda);
v=newv;
uqx=newx;
uqy=newy;
uqz=newz;
end

[x,y,z] = meshgrid(uqx, uqy, uqz);
xslice=2.7;
yslice=0;
zslice=-0.5;
figure( 2);
slice(x,y,z,v, xslice,yslice,zslice);
xlabel('x');
ylabel('y');
zlabel('z');