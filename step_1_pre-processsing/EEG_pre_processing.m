%%
PATH1='/.../EEG_data/dataset/';
PATH2='/.../EEG_data/ICA_data/';
cd(PATH1);
list=dir('*.set');
for k=1:78
    EEG = pop_loadset('filename',list(k).name,'filepath',PATH1);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = pop_eegfiltnew(EEG, 0.5,45,6600,0,[],1);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
    EEG = eeg_checkset( EEG );
    EEG = pop_select( EEG,'nochannel',{'HEOG' 'VEOG'});
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
    EEG = eeg_checkset( EEG );
    EEG = pop_runica(EEG, 'extended',1,'interupt','on');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'filename',list(k).name,'filepath',PATH2);
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
    close all;
end




