function [ theta ] = mleApprox( Q, M, R, K, Z )

theta = zeros(M,R);
for i = 1:M
    for j = 1:R
        theta(i,j) = Q(i,j)/(K(j)-sum(Q(:,j),1))*Z(j)/(1+sum(Q(i,:),2)-Q(i,j)/K(j));
    end
end

end

