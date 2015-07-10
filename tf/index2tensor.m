function [v,uqx,uqy,uqz]=index2tensor(t)
[n,d]=size(t)
uqx=sort(unique(t(:,1)));
uqy=sort(unique(t(:,2)));
uqz=sort(unique(t(:,3)));

[x,y,z] = meshgrid(uqx, uqy, uqz);
count=prod(size(x));
v=zeros( size(x)); % y-x-z
for i=1:count
    onerow=[x(i),y(i),z(i)]
    iia=ismember(t(:,1:3),onerow,'rows');
    vindex=find(iia==1);
    v(i)=t(vindex,4);
end 

xslice=2.7;
yslice=0;
zslice=-0.6;

% xslice=uqx;
% yslice=uqy;
% zslice=uqz;


slice(x,y,z,v, xslice,yslice,zslice);
xlabel('x');
ylabel('y');
zlabel('z');
save('tensor10test.mat','v');

end
 