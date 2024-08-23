%%
PATH='/.../DATA_EEG_fNIRS/';
load([PATH,'DATA_coh_theta.mat']);
load([PATH,'DATA_coh_alpha.mat']);
load([PATH,'DATA_coh_beta.mat']);
load([PATH,'DATA_coh_gamma.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Labels.mat');
PATH1='/.../DATA_weight/';
for s=1:30
    list_A=1:30;
    list_A(list_A==s)=[];
    list_pre=1:18:540;
    list_post=18:18:540;
    list_test=list_pre(s):list_post(s);
    list_train=[];
    for kk=1:29
        list_train=[list_train,list_pre(list_A(kk)):list_post(list_A(kk))];
    end
    Y_train=Labels(list_train);
    Y_test=Labels(list_test);
    YY_train23=1:3:522;%%  2--vs--3 without 1
    YY_train13=2:3:522;%%  1--vs--3 without 2
    YY_train12=3:3:522;%%  1--vs--2 without 3
    list_train23=list_train;
    list_train23(YY_train23)=[];
    list_train13=list_train;
    list_train13(YY_train13)=[];
    list_train12=list_train;
    list_train12(YY_train12)=[];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    YYY_train23=Y_train; %%  2--vs--3 without 1
    YYY_train23(YY_train23)=[];
    YYY_train13=Y_train; %%  1--vs--3 without 2
    YYY_train13(YY_train13)=[];
    YYY_train12=Y_train; %%  1--vs--2 without 3
    YYY_train12(YY_train12)=[];
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%       coh       %%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_theta(list_train23,:,:);
    Y_train=Labels(list_train23);
    X_test=DATA_coh_theta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_theta23.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_theta(list_train13,:,:);
    Y_train=Labels(list_train13);
    X_test=DATA_coh_theta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_theta13.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_theta(list_train12,:,:);
    Y_train=Labels(list_train12);
    X_test=DATA_coh_theta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_theta12.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_alpha(list_train23,:,:);
    Y_train=Labels(list_train23);
    X_test=DATA_coh_alpha(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_alpha23.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_alpha(list_train13,:,:);
    Y_train=Labels(list_train13);
    X_test=DATA_coh_alpha(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_alpha13.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_alpha(list_train12,:,:);
    Y_train=Labels(list_train12);
    X_test=DATA_coh_alpha(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_alpha12.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_beta(list_train23,:,:);
    Y_train=Labels(list_train23);
    X_test=DATA_coh_beta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_beta23.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_beta(list_train13,:,:);
    Y_train=Labels(list_train13);
    X_test=DATA_coh_beta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_beta13.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_beta(list_train12,:,:);
    Y_train=Labels(list_train12);
    X_test=DATA_coh_beta(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_beta12.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_gamma(list_train23,:,:);
    Y_train=Labels(list_train23);
    X_test=DATA_coh_gamma(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_gamma23.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_gamma(list_train13,:,:);
    Y_train=Labels(list_train13);
    X_test=DATA_coh_gamma(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_gamma13.mat'],'data')
    clear data;
    %%%%%%%%%%%%%%%%
    X_train=DATA_coh_gamma(list_train12,:,:);
    Y_train=Labels(list_train12);
    X_test=DATA_coh_gamma(list_test,:,:);
    [t_weight,s_weight]=bilinear_CSP(X_train,Y_train);
    data{1,1}=t_weight;
    data{1,2}=s_weight;
    save([PATH1,'sub_',num2str(s),'_coh_gamma12.mat'],'data')
    clear data;
end








