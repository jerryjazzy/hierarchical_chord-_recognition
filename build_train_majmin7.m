function [train_maj_7, train_min_7] = build_train_majmin7(train_set)
                               
% index for the new matrix
i_maj_7 = 1;
i_min_7 = 1;

len = length(train_set);
train_maj_7 = zeros(len,25);
train_min_7 = zeros(len,25);

for idx = 1:len
    
    if (train_set(idx)<=1)
        continue;    
    elseif (train_set(idx)<=13)
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_maj_7(i_maj_7,:) = [0,bass,treb]; % 0 for maj
        i_maj_7 = i_maj_7+1; continue;
    elseif (train_set(idx)<=25)
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_min_7(i_min_7,:) = [0,bass,treb]; % 0 for min
        i_min_7 = i_min_7+1; continue;
    elseif (train_set(idx)<=37)
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_maj_7(i_maj_7,:) = [1,bass,treb]; % 1 for maj7
        i_maj_7 = i_maj_7+1; continue;
    elseif (train_set(idx)<=49)
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_maj_7(i_maj_7,:) = [2,bass,treb]; % 2 for 7
        i_maj_7 = i_maj_7+1; continue;
    else
        shift = 11 - train_set(idx);
        bass = circshift(train_set(idx,2:13),shift,2);
        treb = circshift(train_set(idx,14:25),shift,2);
        train_min_7(i_min_7,:) = [1,bass,treb]; % 1 for min7
        i_min_7 = i_min_7+1; continue;
    end
    
end

train_maj_7 = train_maj_7(1:i_maj_7-1, :);
train_min_7 = train_min_7(1:i_min_7-1, :);
end