function [train_majmin] = build_train_majmin(train_set)
                               
% side note: circshift(matrix,num_shift,dim) (A,3,2)
% index for the new matrix
i = 1;

len = length(train_set);
train_majmin = zeros(len,25);

for idx = 1:len
    
    if (train_set(idx)<=1)
        continue;    
    elseif (train_set(idx)<=13 || (train_set(idx)>=26 && train_set(idx)<=49))
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_majmin(i,:) = [0,bass,treb]; % 0 for maj
        i = i+1; continue;
    else
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_majmin(i,:) = [1,bass,treb]; % 0 for maj
        i = i+1; continue;
    end
    
end

train_majmin = train_majmin(1:i-1,:);

end