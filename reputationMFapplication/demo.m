% Q=[ 0 1 4 0; 2 0 4 1;1 1 0 5];
B =[
     2     1     1
     3     1     1
     1     2     1
     3     2     1
     1     3     1
     2     3     1
     2     4     1
     3     4     1
     5     3     1];
	 
	 
	 
	 
 A=load('1Avail.TXT');
  AA=sparse(A(:,1),A(:,2),A(:,3));
  AAA=full(AA);
 [B1,B2,B3]=find(AAA);
 B= [B1,B2,B3];
 save('1Avail_2.txt','B','-ASCII');
 
  [B,L,R] =  reindex (B);
  AA=sparse(B(:,1),B(:,2),B(:,3));
  Q=full(AA);
  [m,n]=size(Q);
  fprintf('After filtering, we have %d users, %d services\n',m,n);
 d=0.4;
[ r ,A,history] = reputation( Q,d );
alpha=0.1;
q=2;
[U,S,rmse,history]=repMF(Q,r,alpha,q);
plot(history);
xlabel('iteration');
ylabel('rmse');