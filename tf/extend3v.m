function [newv,newx,newy,newz]=extend3v(v,uqx, uqy, uqz,lambda)
% 3-order tensor, insert points between each two points.

newsize=2*size(v)-1;
newv=zeros(newsize);
for i=1:newsize(1)
    for j=1:newsize(2)
        for k=1:newsize(3)
             if mod(i,2)
                 iset=(i+1)/2;
             else
                 iset=[i/2,i/2+1];
             end
             
             if mod(j,2)
                 jset=(j+1)/2;
             else
                 jset=[j/2,j/2+1];
             end
             
             if mod(k,2)
                 kset=(k+1)/2;
             else
                 kset=[k/2,k/2+1];
             end
             [x,y,z] = meshgrid(iset, jset, kset); 
          
             allaround=[];
             for ii=1:prod(size(x))
             allaround=[allaround,v(x(ii),y(ii),z(ii) )];
             end
%                 newv(i,j,k)=mean(v(x,y,z));
              newv(i,j,k)=mean(allaround)+lambda* std(allaround) ;
        end
    end
end
[ newx ] = extend1v( uqx );
[ newy ] = extend1v( uqy );
[ newz ] = extend1v( uqz );
end
                