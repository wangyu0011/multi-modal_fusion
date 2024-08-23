%%
PATH1='/.../raw_fNIRS/';
PATH2='/.../';
for k=1:30
    %%
    cd(PATH1);
    list1=dir(['sub',num2str(k),'_*']);
    cd([PATH1,list1(1).name]);
    list2=dir('*ST1');
    cd(list2(1).name);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    list3=dir('*.snirf');
    snirf = SnirfLoad(list3(1).name);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data1=snirf.data;
    dod=hmrR_Intensity2OD(data1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ppf=[1.0, 1.0];
    probe=snirf.probe;
    data2= hmrR_OD2Conc( dod, probe, ppf );
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    cd(PATH1);
    fs=40.7;
    hpf=0.01;
    lpf=0.2;
    y=data2.dataTimeSeries;
    [y2,ylpf] = nirs_BandpassFilt( y, fs, hpf, lpf );
    list_HbO=1:3:54;
    list_HbR=2:3:54;
    list_HbT=3:3:54;
    HbO=y2(:,list_HbO);
    HbR=y2(:,list_HbR);
    HbT=y2(:,list_HbT);
    save([PATH2,'HbO_',num2str(k),'-1.mat'],'HbO');
    save([PATH2,'HbR_',num2str(k),'-1.mat'],'HbR');
    save([PATH2,'HbT_',num2str(k),'-1.mat'],'HbT');
end
