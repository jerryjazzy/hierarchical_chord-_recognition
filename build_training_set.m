function [label_set, feature_set, t_feature] = build_training_set(dir_label, chord_type, ...
                                                              dir_feature)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Build the training data.
%
% dir_label: directory of the label set. e.g. 'chord_labels'
%
% chord_type: 'majmin' or 'majmin7'
%
% dir_feature: directory of the feature set. e.g. 'features'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
                                                          
feature_set = [];
cd(dir_feature);
t_feature = [];
temp_t = []; temp_f = [];
x = dir(); cd ..;

t_template = [];
temp_set = [];
label_set = [];
% cd(dir_label);
% y = dir(); 
% cd ..;

for i = 4:length(x)
    % Load feature set
    folder_name = x(i).name;
    file_name = [dir_feature '/' folder_name '/bothchroma.csv'];
    display(['Loading ' file_name]);
    M = csvread(file_name,0,1);
    t_template = M(:,1)';
    t_feature = [temp_t, t_template];  
    feature_set = [temp_f, M(:,2:end)'];    
    temp_t = t_feature;
    temp_f = feature_set;  
    
%     folder_name = y(i).name;
    % Load the corresponding labels
    if ( strcmp(chord_type,'majmin') )
        lab_file = [dir_label '/' folder_name '/majmin.lab'];     
    elseif( strcmp(chord_type, 'majmin7') )
        lab_file = [dir_label '/' folder_name '/majmin7.lab'];
    else
        error('invalid input');
    end
    
    display(['Loading ' lab_file]);
    [chords,timestamps] = labread(lab_file);
    framed_chords = create_ground_truth(timestamps, chords, t_template);
    framed_chords_int = ground_truth_int(framed_chords);
    
    label_set = [temp_set framed_chords_int];
    temp_set = label_set;
    
end

disp('-------Finished-------');
disp('Total number of files: ');
disp(i-3);


end