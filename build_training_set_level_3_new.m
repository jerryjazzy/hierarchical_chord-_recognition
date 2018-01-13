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
        train_majmin(i,:) = [root_num+2,train_set(idx,2:end)];
        i = i+1; continue;
    else
        set_lv3_min(i,:) = [train_set(idx), feature_set(idx,:)];
        i = i+1; continue;
    end
    
end


train_majmin = train_majmin(1:i-1,:);

end