function [train_root] = build_train_root(train_set)
                               

%index for the new matrix
i = 1;

len = length(train_set);
train_root = zeros(len,25);

for idx = 1:len
    if (train_set(idx,1)<=1)
        train_root(i,:) = train_set(idx,:);
        i = i+1;
        continue;
    else
        root_num = mod(train_set(idx)-2,12);
        train_root(i,:) = [root_num+2,train_set(idx,2:end)];
        i = i+1;
    end    
    
end

disp('Size of the training set:');
disp(i-1);

train_root = train_root(1:i-1,:);

end