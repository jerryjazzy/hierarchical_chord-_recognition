% csv read in predictions

pred_hc = csvread('pred_hc_1188.csv');
pred_flat = csvread('pred_1188_flat.csv');
pred_hc = pred_hc(:,2);
pred_flat = pred_flat(:,2);

% plot prediction frame-wise (numbers = classes)
%%
ylabelnames = {'N','X',...
               'Cmaj', 'C#maj', 'Dmaj', 'D#maj', 'Emaj', 'Fmaj', 'F#maj', 'Gmaj', 'G#maj', 'Amaj', 'A#maj', 'Bmaj',...
               'Cmin', 'C#min', 'Dmin', 'D#min', 'Emin', 'Fmin', 'F#min', 'Gmin', 'G#min', 'Amin', 'A#min', 'Bmin',...
               'Cmaj7', 'C#maj7', 'Dmaj7', 'D#maj7', 'Emaj7', 'Fmaj7', 'F#maj7', 'Gmaj7', 'G#maj7', 'Amaj7', 'A#maj7', 'Bmaj7',...
               'C7', 'C#7', 'D7', 'D#7', 'E7', 'F7', 'F#7', 'G7', 'G#7', 'A7', 'A#7', 'B7',...
               'Cm7', 'C#m7', 'Dm7', 'D#m7', 'Em7', 'Fm7', 'F#m7', 'Gm7', 'G#m7', 'Am7', 'A#m7', 'Bm7'};
set(gca,'YTick'      , 0:61); %1:63
set(gca,'YTickLabel' , ylabelnames);
% set(gca,'XTickLabel' , xlabels);
%%
set(gca,'YTick'      , 1:length(template_matrix(:,1)));
set(gca,'YTickLabel' , ylabelnames);
set(gca,'XTick'      , 1:scale:length(template_matrix(1,:)));
set(gca,'XTickLabel' , xlabels);
%%
figure;
plot(label_set, 'ro');
set(gca,'YTick'      , 0:61);
set(gca,'YTickLabel' , ylabelnames);
xlabel('Time');
ylabel('Chord Labels');
%%
hold on
plot(pred_hc,'ko');
%%
count = 0;
for i = 1:length(label_set)
    if (pred_hc(i) == label_set(i))
        count = count + 1;
    end
end

%%
hold on
plot(pred_flat,'ko');




%% plot ground truth

ground_truth = csvread('test_1188.csv');
label_set = ground_truth(:,1);

%%
y_names = {'A','A#','B','C','C#','D','D#','E','F','F#','G','G#','A','A#','B','C','C#','D','D#','E','F','F#','G','G#'};

