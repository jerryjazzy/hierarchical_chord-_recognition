function training_set = trainingMat(directory, chord_type)

training_set = [];
cd(directory);
temp_set = [];
x = dir(); cd ..;

for i = 4:length(x) 
    folder_name = x(i).name;
    if ( strcmp(chord_type,'majmin') )
        lab_file = [directory '/' folder_name '/majmin.lab'];     
    elseif( strcmp(chord_type, 'majmin7') )
        lab_file = [directory '/' folder_name '/majmin7.lab'];
    else
        error('invalid input');
    end
%     for j = 1:length(xx)
         
        
        % Chord recognition algorithm
%         [chromagram, t_chromagram] = compute_chromagram(mp3_file, 8192, 4096, 12, 4, 64.5);
%         chromagram = prefiltering(chromagram, 15, 'median');
        
        % Frame-based annotation creation
        [chords,timestamps] = labread(lab_file);
        framed_chords = create_ground_truth(timestamps, chords);
        framed_chords_int = ground_truth_int(framed_chords);
        
%         for k = 1:size(framed_chords_int,2)
%             if(framed_chords_int(k) == chord_idx)
%                 training_set = [training_set chromagram(:,k)];
%             end
%         end
        training_set = [temp_set framed_chords_int];
        temp_set = training_set;
        display(lab_file)   ;     
%      end
end
disp('Finished.');
disp(i-3);

end