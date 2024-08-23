%%
PATH0='/.../EEG_fNIRS_fusion_nback/DATA_EEG_fNIRS/';
load([PATH0,'DATA_ERSP_theta.mat']);
load([PATH0,'DATA_ERSP_alpha.mat']);
load([PATH0,'DATA_ERSP_beta.mat']);
load([PATH0,'DATA_ERSP_gamma.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load([PATH0,'DATA_coh_theta.mat']);
load([PATH0,'DATA_coh_alpha.mat']);
load([PATH0,'DATA_coh_beta.mat']);
load([PATH0,'DATA_coh_gamma.mat']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PATH='/.../EEG_fNIRS_fusion_nback/DATA_weight/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('Labels.mat');
for qq=1:25
    ACC=[];
    ACC_DST=[];
    for s=1:26
        list_A=1:26;
        list_A(list_A==s)=[];
        list_pre=1:27:702;
        list_post=27:27:702;
        list_test=list_pre(s):list_post(s);
        list_train=[];
        for kk=1:25
            list_train=[list_train,list_pre(list_A(kk)):list_post(list_A(kk))];
        end
        Y_train=Labels(list_train);
        Y_test=Labels(list_test);
        YY_train23=1:3:675;%%  2--vs--3 without 1
        YY_train13=2:3:675;%%  1--vs--3 without 2
        YY_train12=3:3:675;%%  1--vs--2 without 3
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
        tic
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%       ERSP       %%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_theta(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_ERSP_theta(list_test,:,:);
        DATA_ERSP_theta23_train=zeros(length(list_train23),qq*qq);
        DATA_ERSP_theta23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_theta23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_theta23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_theta23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_theta(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_ERSP_theta(list_test,:,:);
        DATA_ERSP_theta13_train=zeros(length(list_train13),qq*qq);
        DATA_ERSP_theta13_test=zeros(length(list_test),qq*qq);
        %%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_theta13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_theta13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_theta13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_theta(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_ERSP_theta(list_test,:,:);
        DATA_ERSP_theta12_train=zeros(length(list_train12),qq*qq);
        DATA_ERSP_theta12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_theta12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_theta12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_theta12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_alpha(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_ERSP_alpha(list_test,:,:);
        DATA_ERSP_alpha23_train=zeros(length(list_train23),qq*qq);
        DATA_ERSP_alpha23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_alpha23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_alpha23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_alpha23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_alpha(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_ERSP_alpha(list_test,:,:);
        DATA_ERSP_alpha13_train=zeros(length(list_train13),qq*qq);
        DATA_ERSP_alpha13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_alpha13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_alpha13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_alpha13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_alpha(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_ERSP_alpha(list_test,:,:);
        DATA_ERSP_alpha12_train=zeros(length(list_train12),qq*qq);
        DATA_ERSP_alpha12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_alpha12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_alpha12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_alpha12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_beta(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_ERSP_beta(list_test,:,:);
        DATA_ERSP_beta23_train=zeros(length(list_train23),qq*qq);
        DATA_ERSP_beta23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_beta23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_beta23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_beta23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_beta(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_ERSP_beta(list_test,:,:);
        DATA_ERSP_beta13_train=zeros(length(list_train13),qq*qq);
        DATA_ERSP_beta13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_beta13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_beta13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_beta13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_beta(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_ERSP_beta(list_test,:,:);
        DATA_ERSP_beta12_train=zeros(length(list_train12),qq*qq);
        DATA_ERSP_beta12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_beta12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_beta12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_beta12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_gamma(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_ERSP_gamma(list_test,:,:);
        DATA_ERSP_gamma23_train=zeros(length(list_train23),qq*qq);
        DATA_ERSP_gamma23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_gamma23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_gamma23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_gamma23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_gamma(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_ERSP_gamma(list_test,:,:);
        DATA_ERSP_gamma13_train=zeros(length(list_train13),qq*qq);
        DATA_ERSP_gamma13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_gamma13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_gamma13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_gamma13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_ERSP_gamma(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_ERSP_gamma(list_test,:,:);
        DATA_ERSP_gamma12_train=zeros(length(list_train12),qq*qq);
        DATA_ERSP_gamma12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_ERSP_gamma12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),28,900);
            DATA_ERSP_gamma12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),28,900);
            DATA_ERSP_gamma12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
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
        DATA_coh_theta23_train=zeros(length(list_train23),qq*qq);
        DATA_coh_theta23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_theta23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_theta23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_theta23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_theta(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_coh_theta(list_test,:,:);
        DATA_coh_theta13_train=zeros(length(list_train13),qq*qq);
        DATA_coh_theta13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_theta13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_theta13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_theta13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_theta(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_coh_theta(list_test,:,:);
        DATA_coh_theta12_train=zeros(length(list_train12),qq*qq);
        DATA_coh_theta12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_theta12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_theta12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_theta12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_alpha(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_coh_alpha(list_test,:,:);
        DATA_coh_alpha23_train=zeros(length(list_train23),qq*qq);
        DATA_coh_alpha23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_alpha23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_alpha23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_alpha23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_alpha(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_coh_alpha(list_test,:,:);
        DATA_coh_alpha13_train=zeros(length(list_train13),qq*qq);
        DATA_coh_alpha13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_alpha13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_alpha13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_alpha13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_alpha(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_coh_alpha(list_test,:,:);
        DATA_coh_alpha12_train=zeros(length(list_train12),qq*qq);
        DATA_coh_alpha12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_alpha12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_alpha12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_alpha12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_beta(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_coh_beta(list_test,:,:);
        DATA_coh_beta23_train=zeros(length(list_train23),qq*qq);
        DATA_coh_beta23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_beta23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_beta23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_beta23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_beta(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_coh_beta(list_test,:,:);
        DATA_coh_beta13_train=zeros(length(list_train13),qq*qq);
        DATA_coh_beta13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_beta13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_beta13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_beta13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_beta(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_coh_beta(list_test,:,:);
        DATA_coh_beta12_train=zeros(length(list_train12),qq*qq);
        DATA_coh_beta12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_beta12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_beta12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_beta12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_gamma(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_coh_gamma(list_test,:,:);
        DATA_coh_gamma23_train=zeros(length(list_train23),qq*qq);
        DATA_coh_gamma23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_gamma23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_gamma23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_gamma23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_gamma(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_coh_gamma(list_test,:,:);
        DATA_coh_gamma13_train=zeros(length(list_train13),qq*qq);
        DATA_coh_gamma13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_gamma13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_gamma13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_gamma13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_coh_gamma(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_coh_gamma(list_test,:,:);
        DATA_coh_gamma12_train=zeros(length(list_train12),qq*qq);
        DATA_coh_gamma12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_coh_gamma12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),378,900);
            DATA_coh_gamma12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),378,900);
            DATA_coh_gamma12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %% 
        %%%%%%%%%%%%%%%%%  1--vs--2 without 3
        X12_train{1}=DATA_ERSP_theta12_train;X12_train{2}=DATA_ERSP_alpha12_train;X12_train{3}=DATA_ERSP_beta12_train;
        X12_train{4}=DATA_ERSP_gamma12_train;X12_train{5}=DATA_coh_theta12_train;X12_train{6}=DATA_coh_alpha12_train;
        X12_train{7}=DATA_coh_beta12_train;X12_train{8}=DATA_coh_gamma12_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X12_test{1}=DATA_ERSP_theta12_test;X12_test{2}=DATA_ERSP_alpha12_test;X12_test{3}=DATA_ERSP_beta12_test;
        X12_test{4}=DATA_ERSP_gamma12_test;X12_test{5}=DATA_coh_theta12_test;X12_test{6}=DATA_coh_alpha12_test;
        X12_test{7}=DATA_coh_beta12_test;X12_test{8}=DATA_coh_gamma12_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY12=[];
        SVM_scores12=[];
        t=0;
        for k1=1:8
            for k2=k1:8
                t=t+1;
                if k1==k2
                    fusion_Train=X12_train{1, k1};
                    fusion_Test=X12_test{1, k1};
                    %%%%%%%%%%%%%%%
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train12,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY12(:,t)=Y_predict1;
                    SVM_scores12(:,:,t)=scores;
                else
                    fusion_Train=[X12_train{1, k1},X12_train{1, k2}];
                    fusion_Test=[X12_test{1, k1},X12_test{1, k2}];
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train12,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY12(:,t)=Y_predict1;
                    SVM_scores12(:,:,t)=scores;
                end
            end
        end
        %%%%%%%%%%%%%%%%%  2--vs--3 without 1
        X23_train{1}=DATA_ERSP_theta23_train;X23_train{2}=DATA_ERSP_alpha23_train;X23_train{3}=DATA_ERSP_beta23_train;
        X23_train{4}=DATA_ERSP_gamma23_train;X23_train{5}=DATA_coh_theta23_train;X23_train{6}=DATA_coh_alpha23_train;
        X23_train{7}=DATA_coh_beta23_train;X23_train{8}=DATA_coh_gamma23_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X23_test{1}=DATA_ERSP_theta23_test;X23_test{2}=DATA_ERSP_alpha23_test;X23_test{3}=DATA_ERSP_beta23_test;
        X23_test{4}=DATA_ERSP_gamma23_test;X23_test{5}=DATA_coh_theta23_test;X23_test{6}=DATA_coh_alpha23_test;
        X23_test{7}=DATA_coh_beta23_test;X23_test{8}=DATA_coh_gamma23_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY23=[];
        SVM_scores23=[];
        t=0;
        for k1=1:8
            for k2=k1:8
                t=t+1;
                if k1==k2
                    fusion_Train=X23_train{1, k1};
                    fusion_Test=X23_test{1, k1};
                    %%%%%%%%%%%%%%%
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    %%%%%%%%%%%%%%%
                    svm1 = fitcsvm(fusion_Train,YYY_train23,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY23(:,t)=Y_predict1;
                    SVM_scores23(:,:,t)=scores;
                else
                    fusion_Train=[X23_train{1, k1},X23_train{1, k2}];
                    fusion_Test=[X23_test{1, k1},X23_test{1, k2}];
                    %%%%%%%%%%%%%%%
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train23,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY23(:,t)=Y_predict1;
                    SVM_scores23(:,:,t)=scores;
                end
            end
        end
        %%%%%%%%%%%%%%%%%  1--vs--3 without 2
        X13_train{1}=DATA_ERSP_theta13_train;X13_train{2}=DATA_ERSP_alpha13_train;X13_train{3}=DATA_ERSP_beta13_train;
        X13_train{4}=DATA_ERSP_gamma13_train;X13_train{5}=DATA_coh_theta13_train;X13_train{6}=DATA_coh_alpha13_train;
        X13_train{7}=DATA_coh_beta13_train;X13_train{8}=DATA_coh_gamma13_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X13_test{1}=DATA_ERSP_theta13_test;X13_test{2}=DATA_ERSP_alpha13_test;X13_test{3}=DATA_ERSP_beta13_test;
        X13_test{4}=DATA_ERSP_gamma13_test;X13_test{5}=DATA_coh_theta13_test;X13_test{6}=DATA_coh_alpha13_test;
        X13_test{7}=DATA_coh_beta13_test;X13_test{8}=DATA_coh_gamma13_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY13=[];
        SVM_scores13=[];
        t=0;
        for k1=1:8
            for k2=k1:8
                t=t+1;
                if k1==k2
                    fusion_Train=X13_train{1, k1};
                    fusion_Test=X13_test{1, k1};
                    %%%%%%%%%%%%%%%
                    %%%%%%%%%%%%%%%
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train13,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY13(:,t)=Y_predict1;
                    SVM_scores13(:,:,t)=scores;
                else
                    fusion_Train=[X13_train{1, k1},X13_train{1, k2}];
                    fusion_Test=[X13_test{1, k1},X13_test{1, k2}];
                    c=cov(fusion_Train);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train13,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY13(:,t)=Y_predict1;
                    SVM_scores13(:,:,t)=scores;
                end
            end
        end
        %%%%%%%%%%%%%%
        %  1--vs--2
        %  2--vs--3
        %  3--vs--1
        %%%%%%%%%%%%
        YY3=[];
        for k=1:length(Y_predict1)
            [H1,I1]=sort(abs(SVM_scores13(k,1,:)),'descend');
            YY31_1=sum(YY13(k,I1(1:double(floor(t/2))))==1);
            YY31_3=sum(YY13(k,I1(1:double(floor(t/2))))==3);
            %%%%%%%%%%%%%
            [H1,I1]=sort(abs(SVM_scores12(k,1,:)),'descend');
            YY12_1=sum(YY12(k,I1(1:double(floor(t/2))))==1);
            YY12_2=sum(YY12(k,I1(1:double(floor(t/2))))==2);
            %%%%%%%%%%%%%
            [H1,I1]=sort(abs(SVM_scores23(k,1,:)),'descend');
            YY23_2=sum(YY23(k,I1(1:double(floor(t/2))))==2);
            YY23_3=sum(YY23(k,I1(1:double(floor(t/2))))==3);
            %%%%%%%%%%%%%%
            if (YY31_1>YY31_3)&&(YY12_1>YY12_2)
                YY3(k)=1;
            elseif (YY31_3>YY31_1)&&(YY23_3>YY23_2)
                YY3(k)=3;
            else
                YY3(k)=2;
            end
        end
        ACC{1,s}=YY3;
        ACC{2,s}=toc;
        %%%%%%%%%%%%%%
        %  1--vs--2
        %  2--vs--3
        %  3--vs--1
        %%%%%%%%%%%%
        YY2=[];
        for kk1=1:27
            %%%%%%%%%%%%%%%
            M1_P1=reshape(SVM_scores12(kk1,1,:),1,36);
            M1_P1(M1_P1<0)=0;M1_P1(M1_P1>1)=1;
            M1_P2=-reshape(SVM_scores12(kk1,1,:),1,36);
            M1_P2(M1_P2<0)=0;M1_P2(M1_P2>1)=1;
            %%%%%%%%%%%%%%%
            M2_P1=reshape(SVM_scores13(kk1,1,:),1,36);
            M2_P1(M2_P1<0)=0;M2_P1(M2_P1>1)=1;
            M2_P3=-reshape(SVM_scores13(kk1,1,:),1,36);
            M2_P3(M2_P3<0)=0;M2_P3(M2_P3>1)=1;
            %%%%%%%%%%%%%%%
            M3_P2=reshape(SVM_scores23(kk1,1,:),1,36);
            M3_P2(M3_P2<0)=0;M3_P2(M3_P2>1)=1;
            M3_P3=-reshape(SVM_scores23(kk1,1,:),1,36);
            M3_P3(M3_P3<0)=0;M3_P3(M3_P3>1)=1;
            %%%%
            P1=M1_P1.*M2_P1;
            P2=M1_P2.*M3_P2;
            P3=M2_P3.*M3_P3;
            M=[P1;P2;P3];
            MM=sum(M);
            [H1,I1]=sort(MM,'descend');
            M=M(:,I1(1:double(floor(t/2))));
            MM=sum(M);
            M(4,:)=1-MM;
            M_Smets=DST(M,2);
            [H,I]=max(M_Smets(1:3));
            YY2(kk1)=I;
        end
        ACC_DST{1,s}=YY2;
        ACC_DST{2,s}=toc;
    end
    save(['fusion_EEG_DST_',num2str(qq),'.mat'],'ACC_DST');
    save(['fusion_EEG_',num2str(qq),'.mat'],'ACC');
end
clear all














