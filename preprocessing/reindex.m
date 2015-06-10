function [B,L,R] =  reindex (A)
%reindex a matrix in a triple from to delete the zero column and rows
% A: a matrix in a triple form [row index, column index, value]
% B: the new index in triple form, without zero columns or rows
% L: what are the old index for the new index 1 2 3 4 5 for row index
% R: for column index
%{
 demo:
A=[1 2 1;1 5 1; 2 4 1;7 1 1];
 [B,L,R] =  reindex (A)
%}

 [L,IA,IC1] = unique(A(:,1));
 [R,IA,IC2] = unique(A(:,2));
 B=zeros(size(A));
 B(:,1)=IC1;
 B(:,2)=IC2;
 B(:,3)=A(:,3);
 
end
 
