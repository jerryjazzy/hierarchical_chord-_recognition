function framed_chords_int = ground_truth_int(framed_chords)

framed_chords_int = zeros(1,length(framed_chords));
for i = 1:length(framed_chords)
    if(strcmp(framed_chords(i), 'N'))
        framed_chords_int(i) = 0; % No-chord (0)
        continue;
    elseif(strcmp(framed_chords(i), 'X'))
        framed_chords_int(i) = 1; % Other (1)
        continue;
        
    % Major Chords (2~13)
    elseif( strcmp(framed_chords(i), 'C:maj'))
        framed_chords_int(i) = 2;
        continue;
    elseif((strcmp(framed_chords(i), 'C#:maj') || strcmp(framed_chords(i), 'Db:maj')))
        framed_chords_int(i) = 3;
        continue;
    elseif( strcmp(framed_chords(i), 'D:maj'))
        framed_chords_int(i) = 4;
        continue;
    elseif((strcmp(framed_chords(i), 'D#:maj') || strcmp(framed_chords(i), 'Eb:maj')))
        framed_chords_int(i) = 5;
        continue;
    elseif( strcmp(framed_chords(i), 'E:maj'))
        framed_chords_int(i) = 6;
        continue;
    elseif( strcmp(framed_chords(i), 'F:maj'))
        framed_chords_int(i) = 7;
        continue;
    elseif((strcmp(framed_chords(i), 'F#:maj') || strcmp(framed_chords(i), 'Gb:maj')))
        framed_chords_int(i) = 8;
        continue;
    elseif( strcmp(framed_chords(i), 'G:maj'))
        framed_chords_int(i) = 9;
        continue;
    elseif((strcmp(framed_chords(i), 'G#:maj') || strcmp(framed_chords(i), 'Ab:maj')))
        framed_chords_int(i) = 10;
        continue;
    elseif( strcmp(framed_chords(i), 'A:maj'))
        framed_chords_int(i) = 11;
        continue;
    elseif((strcmp(framed_chords(i), 'A#:maj') || strcmp(framed_chords(i), 'Bb:maj')))
        framed_chords_int(i) = 12;
        continue;
    elseif( strcmp(framed_chords(i), 'B:maj'))
        framed_chords_int(i) = 13;
        continue;
%     % Minor Chords (14~25)
%     elseif( strcmp(framed_chords(i), 'C:min'))
%         framed_chords_int(i) = 2;
%         continue;
%     elseif((strcmp(framed_chords(i), 'C#:min') || strcmp(framed_chords(i), 'Db:min')))
%         framed_chords_int(i) = 3;
%         continue;
%     elseif( strcmp(framed_chords(i), 'D:min'))
%         framed_chords_int(i) = 4;
%         continue;
%     elseif((strcmp(framed_chords(i), 'D#:min') || strcmp(framed_chords(i), 'Eb:min')))
%         framed_chords_int(i) = 5;
%         continue;
%     elseif( strcmp(framed_chords(i), 'E:min'))
%         framed_chords_int(i) = 6;
%         continue;
%     elseif( strcmp(framed_chords(i), 'F:min'))
%         framed_chords_int(i) = 7;
%         continue;
%     elseif((strcmp(framed_chords(i), 'F#:min') || strcmp(framed_chords(i), 'Gb:min')))
%         framed_chords_int(i) = 8;
%         continue;
%     elseif( strcmp(framed_chords(i), 'G:min'))
%         framed_chords_int(i) = 9;
%         continue;
%     elseif((strcmp(framed_chords(i), 'G#:min') || strcmp(framed_chords(i), 'Ab:min')))
%         framed_chords_int(i) = 10;
%         continue;
%     elseif( strcmp(framed_chords(i), 'A:min'))
%         framed_chords_int(i) = 11;
%         continue;
%     elseif((strcmp(framed_chords(i), 'A#:min') || strcmp(framed_chords(i), 'Bb:min')))
%         framed_chords_int(i) = 12;
%         continue;
%     elseif( strcmp(framed_chords(i), 'B:min'))
%         framed_chords_int(i) = 13;
%         continue;
%         
    % Minor Chords (14~25)
    elseif( strcmp(framed_chords(i), 'C:min'))
        framed_chords_int(i) = 14;
        continue;
    elseif((strcmp(framed_chords(i), 'C#:min') || strcmp(framed_chords(i), 'Db:min')))
        framed_chords_int(i) = 15;
        continue;
    elseif( strcmp(framed_chords(i), 'D:min'))
        framed_chords_int(i) = 16;
        continue;
    elseif((strcmp(framed_chords(i), 'D#:min') || strcmp(framed_chords(i), 'Eb:min')))
        framed_chords_int(i) = 17;
        continue;
    elseif( strcmp(framed_chords(i), 'E:min'))
        framed_chords_int(i) = 18;
        continue;
    elseif( strcmp(framed_chords(i), 'F:min'))
        framed_chords_int(i) = 19;
        continue;
    elseif((strcmp(framed_chords(i), 'F#:min') || strcmp(framed_chords(i), 'Gb:min')))
        framed_chords_int(i) = 20;
        continue;
    elseif( strcmp(framed_chords(i), 'G:min'))
        framed_chords_int(i) = 21;
        continue;
    elseif((strcmp(framed_chords(i), 'G#:min') || strcmp(framed_chords(i), 'Ab:min')))
        framed_chords_int(i) = 22;
        continue;
    elseif( strcmp(framed_chords(i), 'A:min'))
        framed_chords_int(i) = 23;
        continue;
    elseif((strcmp(framed_chords(i), 'A#:min') || strcmp(framed_chords(i), 'Bb:min')))
        framed_chords_int(i) = 24;
        continue;
    elseif( strcmp(framed_chords(i), 'B:min'))
        framed_chords_int(i) = 25;
        continue;
        
    % Major 7ths (26~37)
    elseif( strcmp(framed_chords(i), 'C:maj7'))
        framed_chords_int(i) = 26;
        continue;
    elseif((strcmp(framed_chords(i), 'C#:maj7') || strcmp(framed_chords(i), 'Db:maj7')))
        framed_chords_int(i) = 27;
        continue;
    elseif( strcmp(framed_chords(i), 'D:maj7'))
        framed_chords_int(i) = 28;
        continue;
    elseif((strcmp(framed_chords(i), 'D#:maj7') || strcmp(framed_chords(i), 'Eb:maj7')))
        framed_chords_int(i) = 29;
        continue;
    elseif( strcmp(framed_chords(i), 'E:maj7'))
        framed_chords_int(i) = 30;
        continue;
    elseif( strcmp(framed_chords(i), 'F:maj7'))
        framed_chords_int(i) = 31;
        continue;
    elseif((strcmp(framed_chords(i), 'F#:maj7') || strcmp(framed_chords(i), 'Gb:maj7')))
        framed_chords_int(i) = 32;
        continue;
    elseif( strcmp(framed_chords(i), 'G:maj7'))
        framed_chords_int(i) = 33;
        continue;
    elseif((strcmp(framed_chords(i), 'G#:maj7') || strcmp(framed_chords(i), 'Ab:maj7')))
        framed_chords_int(i) = 34;
        continue;
    elseif( strcmp(framed_chords(i), 'A:maj7'))
        framed_chords_int(i) = 35;
        continue;
    elseif((strcmp(framed_chords(i), 'A#:maj7') || strcmp(framed_chords(i), 'Bb:maj7')))
        framed_chords_int(i) = 36;
        continue;
    elseif( strcmp(framed_chords(i), 'B:maj7'))
        framed_chords_int(i) = 37;
        continue;  
       
    % Dominant 7ths (38~49)
    elseif( strcmp(framed_chords(i), 'C:7'))
        framed_chords_int(i) = 38;
        continue;
    elseif((strcmp(framed_chords(i), 'C#:7') || strcmp(framed_chords(i), 'Db:7')))
        framed_chords_int(i) = 39;
        continue;
    elseif( strcmp(framed_chords(i), 'D:7'))
        framed_chords_int(i) = 40;
        continue;
    elseif((strcmp(framed_chords(i), 'D#:7') || strcmp(framed_chords(i), 'Eb:7')))
        framed_chords_int(i) = 41;
        continue;
    elseif( strcmp(framed_chords(i), 'E:7'))
        framed_chords_int(i) = 42;
        continue;
    elseif( strcmp(framed_chords(i), 'F:7'))
        framed_chords_int(i) = 43;
        continue;
    elseif((strcmp(framed_chords(i), 'F#:7') || strcmp(framed_chords(i), 'Gb:7')))
        framed_chords_int(i) = 44;
        continue;
    elseif( strcmp(framed_chords(i), 'G:7'))
        framed_chords_int(i) = 45;
        continue;
    elseif((strcmp(framed_chords(i), 'G#:7') || strcmp(framed_chords(i), 'Ab:7')))
        framed_chords_int(i) = 46;
        continue;
    elseif( strcmp(framed_chords(i), 'A:7'))
        framed_chords_int(i) = 47;
        continue;
    elseif((strcmp(framed_chords(i), 'A#:7') || strcmp(framed_chords(i), 'Bb:7')))
        framed_chords_int(i) = 48;
        continue;
    elseif( strcmp(framed_chords(i), 'B:7'))
        framed_chords_int(i) = 49;
        continue;  
       
    % Minor 7ths (50~61)
    elseif( strcmp(framed_chords(i), 'C:min7'))
        framed_chords_int(i) = 50;
        continue;
    elseif((strcmp(framed_chords(i), 'C#:min7') || strcmp(framed_chords(i), 'Db:min7')))
        framed_chords_int(i) = 51;
        continue;
    elseif( strcmp(framed_chords(i), 'D:min7'))
        framed_chords_int(i) = 52;
        continue;
    elseif((strcmp(framed_chords(i), 'D#:min7') || strcmp(framed_chords(i), 'Eb:min7')))
        framed_chords_int(i) = 53;
        continue;
    elseif( strcmp(framed_chords(i), 'E:min7'))
        framed_chords_int(i) = 54;
        continue;
    elseif( strcmp(framed_chords(i), 'F:min7'))
        framed_chords_int(i) = 55;
        continue;
    elseif((strcmp(framed_chords(i), 'F#:min7') || strcmp(framed_chords(i), 'Gb:min7')))
        framed_chords_int(i) = 56;
        continue;
    elseif( strcmp(framed_chords(i), 'G:min7'))
        framed_chords_int(i) = 57;
        continue;
    elseif((strcmp(framed_chords(i), 'G#:min7') || strcmp(framed_chords(i), 'Ab:min7')))
        framed_chords_int(i) = 58;
        continue;
    elseif( strcmp(framed_chords(i), 'A:min7'))
        framed_chords_int(i) = 59;
        continue;
    elseif((strcmp(framed_chords(i), 'A#:min7') || strcmp(framed_chords(i), 'Bb:min7')))
        framed_chords_int(i) = 60;
        continue;
    elseif( strcmp(framed_chords(i), 'B:min7'))
        framed_chords_int(i) = 61;
        continue;  
    
    end
end

end