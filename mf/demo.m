

Q=[ 0 1 4 0; 2 0 4 1;1 1 0 5];
 d=0.1;
[ r ,A,history] = reputation( Q,d );
alpha=0.1;
[U,S,e,history]=repMF(Q,r,alpha);
plot(history);
xlabel('iteration');
ylabel('rmse');