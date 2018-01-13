function [train_1,train_2,train_3,train_4,train_5,...
          test_1, test_2, test_3, test_4, test_5] = build_train_test(...
                                   training_set, Indices)
                               
i_1 = 1;                               
i_2 = 1;                               
i_3 = 1;                               
i_4 = 1;                               
i_5 = 1;                               
    

len = length(Indices);
sub_len = ceil(length(Indices)/5)+1;
subset_1 = zeros(sub_len,25);
subset_2 = zeros(sub_len,25);    
subset_3 = zeros(sub_len,25);
subset_4 = zeros(sub_len,25);
subset_5 = zeros(sub_len,25);

for j = 1:len
    if (Indices(j)==1)
        subset_1(i_1,:) = training_set(j,:);
        i_1 = i_1 + 1;
        continue;    
    elseif (Indices(j)==2)
        subset_2(i_2,:) = training_set(j,:);
        i_2 = i_2 + 1;
        continue;
    elseif (Indices(j)==3)
        subset_3(i_3,:) = training_set(j,:);
        i_3 = i_3 + 1;
        continue;
    elseif (Indices(j)==4)
        subset_4(i_4,:) = training_set(j,:);
        i_4 = i_4 + 1;
        continue;
    elseif (Indices(j)==5)
        subset_5(i_5,:) = training_set(j,:);
        i_5 = i_5 + 1;
        continue;
    end
    
end

subset_1 = subset_1(1:i_1-1,:);
subset_2 = subset_2(1:i_2-1,:);
subset_3 = subset_3(1:i_3-1,:);
subset_4 = subset_4(1:i_4-1,:);
subset_5 = subset_5(1:i_5-1,:);

train_1 = [subset_1;subset_2;subset_3;subset_4];
test_1 = [subset_5];
train_2 = [subset_1;subset_2;subset_3;subset_5];
test_2 = [subset_4];
train_3 = [subset_1;subset_2;subset_4;subset_5];
test_3 = [subset_3];
train_4 = [subset_1;subset_3;subset_4;subset_5];
test_4 = [subset_2];
train_5 = [subset_2;subset_3;subset_4;subset_5];
test_5 = [subset_1];
                                                        
end