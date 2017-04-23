% Input: number of labels k
%       vector theta of d rows, 1 column
%       vector b of k-1 rows, 1 column
%       vector x of d rows, 1 column
% Output: label (1 or 2 ... or k)
function label = rankpred(k,theta,b,x)

if dot(theta,x) <= b(1)
    label = 1;
end

if k > 2
    for l=1:k-2
        if b(l) < dot(theta,x)
            if dot(theta,x) <= b(l+1)
                    label = l+1;
                    break;
           
            end
        end
    end
end

if b(k-1) < dot(theta,x)
        label = k;
end
disp(label)

                