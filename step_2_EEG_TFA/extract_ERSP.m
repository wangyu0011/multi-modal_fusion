%%
load('matlab_block_900.mat')
PATH1='/.../EEG_data/block_data/back_0/';
PATH2='/.../EEG_data/block_data/TF_back_0/';
cd(PATH1);
list=dir('*.set');
for k=1:length(list)
    EEG = pop_loadset('filename',list(k).name,'filepath',PATH1);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );
    for t1=1:3
        DATA=zeros(28,42,900);
        for t2=1:28
            data=EEG.data(t2,1:44999,t1)';
            [alltfX freqs timesout R] = timefreq(data, g.srate, tmioutopt{:}, ...
                    'winsize', 130, 'tlimits', g.tlimits, 'detrend', g.detrend, ...
                    'itctype', g.type, 'wavelet', g.cycles, 'verbose', g.verbose, ...
                    'padratio', 8, 'freqs', g.freqs, 'freqscale', g.freqscale, ...
                    'nfreqs', g.nfreqs, 'timestretch', {g.timeStretchMarks', g.timeStretchRefs}, timefreqopts{:});
            DATA(t2,:,:)=alltfX;
        end
        A=list(k).name;
        A1=A(1:end-4);
        save([PATH2,A1,'_block_',num2str(t1),'.mat'],'DATA');
    end
end












