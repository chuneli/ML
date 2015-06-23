function [ newx ] = extend1v( uqx )
% one-order vectors, insert one point between each two points
newx=zeros(1,2*length(uqx)-1);
for i=1:length(newx)
    if mod(i,2)
        index=(i+1)/2;
        newx(i)=uqx(index);
    else
         kset=[i/2,i/2+1];
         newx(i)=mean( uqx(kset)) ;
end

end