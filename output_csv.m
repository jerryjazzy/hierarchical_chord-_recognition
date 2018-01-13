tic;
train_root_csv = [zeros(1,25);train_2_root];
train_majmin_csv = [zeros(1,25);train_2_majmin];
train_maj7_csv = [zeros(1,25);train_2_maj_7];
train_min7_csv = [zeros(1,25);train_2_min_7];

% train_flat_csv = [zeros(1,25);train_1];

disp('writing root');
csvwrite('train_2_root.csv', train_root_csv);
disp('writing majmin');
csvwrite('train_2_majmin.csv', train_majmin_csv);
disp('writing maj&7');
csvwrite('train_2_maj_7.csv', train_maj7_csv);
disp('writing min&7');
csvwrite('train_2_min_7.csv', train_min7_csv);
% disp('writing flat');
% csvwrite('train_1_flat.csv', train_flat_csv);

disp('Done.');

toc;
%%
test_1_csv = [zeros(1,25);test_1188];
csvwrite('test_1188.csv', test_1_csv);





%% BELOW ARE USELESS AT THIS STAGE
num_samples = 4143772;


N_7 = label_set_7(1:num_samples);
M   = feature_set(:,1:num_samples);
N_majmin  = label_set_majmin(1:num_samples);
N_root = label_set_root(1:num_samples);

%%
training_set_7 = zeros(num_samples+1,25);
training_set_7(2:num_samples+1,1) = N_7';
training_set_7(2:num_samples+1,2:25) = M';
disp('writing 7ths');
csvwrite('train_sklearn_7.csv', training_set_7);
disp('Done.');

%%
training_set_majmin = zeros(num_samples+1,25);
training_set_majmin(2:num_samples+1,1) = N_majmin';
training_set_majmin(2:num_samples+1,2:25) = M';
disp('writing majmins');
csvwrite('train_sklearn_majmin.csv', training_set_majmin);
disp('Done.');

%%
training_set_root = zeros(num_samples+1,25);
training_set_root(2:num_samples+1,1) = N_root';
training_set_root(2:num_samples+1,2:25) = M';
disp('writing roots');
csvwrite('train_sklearn_root.csv', training_set_root);
disp('Done.');

%%

disp('writing ');
csvwrite('train_2_1.csv', training_set_lv2_C);
disp('Done.');

%%
disp('writing ');
csvwrite('train_2_2.csv', training_set_lv2_Db);
disp('Done.');
disp('writing ');
csvwrite('train_2_3.csv', training_set_lv2_D);
disp('Done.');
disp('writing ');
csvwrite('train_2_4.csv', training_set_lv2_Eb);
disp('Done.');
disp('writing ');
csvwrite('train_2_5.csv', training_set_lv2_E);
disp('Done.');
disp('writing ');
csvwrite('train_2_6.csv', training_set_lv2_F);
disp('Done.');
disp('writing ');
csvwrite('train_2_7.csv', training_set_lv2_Gb);
disp('Done.');
disp('writing ');
csvwrite('train_2_8.csv', training_set_lv2_G);
disp('Done.');
disp('writing ');
csvwrite('train_2_9.csv', training_set_lv2_Ab);
disp('Done.');
disp('writing ');
csvwrite('train_2_10.csv', training_set_lv2_A);
disp('Done.');
disp('writing ');
csvwrite('train_2_11.csv', training_set_lv2_Bb);
disp('Done.');
disp('writing ');
csvwrite('train_2_12.csv', training_set_lv2_B);
disp('Done.');
%%

disp('writing ');
csvwrite('train_3_1.csv', training_set_lv3_Cmaj);
disp('Done.');


%%
disp('writing ');
csvwrite('train_3_3.csv', training_set_lv3_Dbmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_5.csv', training_set_lv3_Dmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_7.csv', training_set_lv3_Ebmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_9.csv', training_set_lv3_Emaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_11.csv', training_set_lv3_Fmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_13.csv', training_set_lv3_Gbmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_15.csv', training_set_lv3_Gmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_17.csv', training_set_lv3_Abmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_19.csv', training_set_lv3_Amaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_21.csv', training_set_lv3_Bbmaj);
disp('Done.');
disp('writing ');
csvwrite('train_3_23.csv', training_set_lv3_Bmaj);
disp('Done.');

%%
disp('writing ');
csvwrite('train_3_2.csv', training_set_lv3_Cmin);
disp('writing ');
csvwrite('train_3_4.csv', training_set_lv3_Dbmin);
disp('writing ');
csvwrite('train_3_6.csv', training_set_lv3_Dmin);
disp('writing ');
csvwrite('train_3_8.csv', training_set_lv3_Ebmin);
disp('writing ');
csvwrite('train_3_10.csv', training_set_lv3_Emin);
disp('writing ');
csvwrite('train_3_12.csv', training_set_lv3_Fmin);
disp('writing ');
csvwrite('train_3_14.csv', training_set_lv3_Gbmin);
disp('writing ');
csvwrite('train_3_16.csv', training_set_lv3_Gmin);
disp('writing ');
csvwrite('train_3_18.csv', training_set_lv3_Abmin);
disp('writing ');
csvwrite('train_3_20.csv', training_set_lv3_Amin);
disp('writing ');
csvwrite('train_3_22.csv', training_set_lv3_Bbmin);
disp('writing ');
csvwrite('train_3_24.csv', training_set_lv3_Bmin);

%%

train_root = [zeros(1,25);x_train];
test_root  = [zeros(1,25);x_test];

disp('writing');
csvwrite('training_set_root.csv', train_root);
csvwrite('testing.csv', test_root);
disp('Done.');