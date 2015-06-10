
n = 300;
d = 10;
sigma = [1,1,1,0.5*ones(1,7)]; 
Sigma = diag(sigma);
mu = zeros(1,d);
k = 4;
W = zeros(d,d);
for i=1:k
   W(:,i) = gaussSample(mu, sigma(i)*eye(d), 1);
end
X = randn(d,n); %%%%
epsilon=randn(d,n);
X = W*X + epsilon;
T = T';