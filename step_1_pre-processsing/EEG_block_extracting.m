%%
PATH1='/.../EEG_data/ICA_data/';
PATH2='/.../EEG_data/clear_data/';
cd(PATH1);
list=dir('*.set');
for k=1:length(list)
    EEG = pop_loadset('filename',list(k).name,'filepath',PATH1);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
%     pop_eegplot( EEG, 0, 1, 1);
%     EEG = eeg_checkset( EEG );
    EEG = pop_subcomp( EEG, [1  2  3  4], 0);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'filename',list(k).name,'filepath',PATH2);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
end
%%
PATH1='/.../EEG_data/clear_data/';
PATH2='/.../EEG_data/block_data/back_0/';
cd(PATH1);
list=dir('*.set');
for k=1:length(list)
    EEG = pop_loadset('filename',list(k).name,'filepath',PATH1);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    EEG = pop_epoch( EEG, {  'S112'  }, [-3  42], 'newname', 'EEG epochs', 'epochinfo', 'yes');
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
    EEG = eeg_checkset( EEG );
    EEG = pop_rmbase( EEG, [-3000     0]);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'filename',list(k).name,'filepath',PATH2);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
end
%%
