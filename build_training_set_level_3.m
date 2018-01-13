function [training_set_lv_3] = build_training_set_level_3(...
                                   feature_set, label_set,j)

% index for the new matrix
i = 2;

% label index (e.g. j(cmaj)=2, j(cmin)=14)
% j = 2;

len = length(label_set);
training_set_lv_3 = zeros(len+1,25);
feature_set = feature_set';
label_set = label_set';

for idx = 1:len
    
    if (label_set(idx)==j || label_set(idx)==j+36 )
        training_set_lv_3(i,:) = [label_set(idx), feature_set(idx,:)];
        i = i+1;
        continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;
%     elseif (label_set(idx)==3 || label_set(idx)==15)
%         training_set_lv_2(i,:) = [label_set(idx), feature_set(idx,:)];
%         i = i+1;
%         continue;        
    end
end

disp('Size of the training set:');
disp(i-1)

training_set_lv_3 = training_set_lv_3(1:i-1,:);                               
                               
end                               