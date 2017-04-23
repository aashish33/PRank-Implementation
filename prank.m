% Input: number of iterations L
%        number of labels k
%        matrix X of features, with n rows (samples), d columns (features)
%            X(i,j) is the j-th feature of the i-th sample
%        vector y of labels, with n rows (samples), 1 column
%            y(i) is the label (1 or 2 ... or k) of the i-th sample
% Output: vector theta of d rows, 1 column
%         vector b of k-1 rows, 1 column
function [theta b] = prank(L,k,X,y)
[n d] = size(X);
theta = zeros(1,d);
b = zeros(k-1,1);
s = zeros(n,k-1);
for l=1:k-1
    b(l)=l;
end
for iter=1:L
    for t = 1:n
        E = [];
        for l=1:k-1
            if y(t) <= l
                s(t,l) = -1;
            elseif y(t) > l
                s(t,l) = +1;
            end
            if s(t,l)*[dot(theta,X([t],:)) - b(l)] <= 0
                E = [E l];
            end
        if isempty(E)
        else
            sum = 0;
            for e = E
                sum = sum + s(t,e);
            theta = theta +  sum*X([t],:);
            end
            for e = E
                b(e) = b(e) - s(t,e);
            end
        end
        end
    end
end
theta = transpose(theta);
            
        