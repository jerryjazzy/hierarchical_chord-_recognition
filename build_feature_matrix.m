function [feature_mat,t_feature] = build_feature_matrix(directory)

feature_mat = [];
cd(directory);
t_feature = [];
temp_t = []; temp_f = [];
x = dir(); cd ..;
for i = 4:length(x)
    folder_name = x(i).name;
    file_name = [directory '/' folder_name '/bothchroma.csv'];
    display(['Loading ' file_name]);
    M = csvread(file_name,0,1);
    t_feature = [temp_t, M(:,1)'];  
    feature_mat = [temp_f, M(:,2:end)'];    
    temp_t = t_feature;
    temp_f = feature_mat;    
end

disp('Finished.');
disp('Total number of files: ');
disp(i-3);

end


