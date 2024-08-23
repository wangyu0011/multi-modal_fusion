%%
PATH0='/.../EEG_fNIRS_fusion_nback/DATA_EEG_fNIRS/';
load([PATH0,'DATA_HbR.mat']);
load([PATH0,'DATA_HbO.mat']);
load([PATH0,'DATA_HbT.mat']);
PATH='/.../EEG_fNIRS_fusion_nback/DATA_weight/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
        %%%%%%%       fNIRS       %%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbO(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_HbO(list_test,:,:);
        DATA_HbO23_train=zeros(length(list_train23),qq*qq);
        DATA_HbO23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbO23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbO23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbO23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbO(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_HbO(list_test,:,:);
        DATA_HbO13_train=zeros(length(list_train13),qq*qq);
        DATA_HbO13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbO13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbO13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbO13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbO(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_HbO(list_test,:,:);
        DATA_HbO12_train=zeros(length(list_train12),qq*qq);
        DATA_HbO12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbO12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbO12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbO12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbR(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_HbR(list_test,:,:);
        DATA_HbR23_train=zeros(length(list_train23),qq*qq);
        DATA_HbR23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbR23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbR23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbR23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbR(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_HbR(list_test,:,:);
        DATA_HbR13_train=zeros(length(list_train13),qq*qq);
        DATA_HbR13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbR13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbR13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbR13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbR(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_HbR(list_test,:,:);
        DATA_HbR12_train=zeros(length(list_train12),qq*qq);
        DATA_HbR12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbR12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbR12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbR12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbT(list_train23,:,:);
        Y_train=Labels(list_train23);
        X_test=DATA_HbT(list_test,:,:);
        DATA_HbT23_train=zeros(length(list_train23),qq*qq);
        DATA_HbT23_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbT23.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbT23_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbT23_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbT(list_train13,:,:);
        Y_train=Labels(list_train13);
        X_test=DATA_HbT(list_test,:,:);
        DATA_HbT13_train=zeros(length(list_train13),qq*qq);
        DATA_HbT13_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbT13.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbT13_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbT13_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %%%%%%%%%%%%%%%%
        X_train=DATA_HbT(list_train12,:,:);
        Y_train=Labels(list_train12);
        X_test=DATA_HbT(list_test,:,:);
        DATA_HbT12_train=zeros(length(list_train12),qq*qq);
        DATA_HbT12_test=zeros(length(list_test),qq*qq);
        %%%%%%%
        load([PATH,'sub_',num2str(s),'_HbT12.mat']);
        s_weight=data{1, 2};
        t_weight=data{1, 1};
        weight_sptial=s_weight(:,1:qq);
        weight_time=t_weight(:,1:qq);
        clear data
        %%%%%%%
        for tt=1:450
            train=reshape(X_train(tt,:,:),666,521);
            DATA_HbT12_train(tt,:)=reshape((train*weight_time)'*weight_sptial,1,qq*qq);
        end
        for tt=1:27
            test=reshape(X_test(tt,:,:),666,521);
            DATA_HbT12_test(tt,:)=reshape((test*weight_time)'*weight_sptial,1,qq*qq);
        end
        %% 
        %%%%%%%%%%%%%%%%%  1--vs--2 without 3
        X12_train{1}=DATA_HbO12_train;X12_train{2}=DATA_HbR12_train;X12_train{3}=DATA_HbT12_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X12_test{1}=DATA_HbO12_test;X12_test{2}=DATA_HbR12_test;X12_test{3}=DATA_HbT12_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY12=[];
        SVM_scores12=[];
        t=0;
        for k1=1:3
            for k2=k1:3
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
        X23_train{1}=DATA_HbO23_train;X23_train{2}=DATA_HbR23_train;X23_train{3}=DATA_HbT23_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X23_test{1}=DATA_HbO23_test;X23_test{2}=DATA_HbR23_test;X23_test{3}=DATA_HbT23_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY23=[];
        SVM_scores23=[];
        t=0;
        for k1=1:3
            for k2=k1:3
                t=t+1;
                if k1==k2
                    fusion_Train=X23_train{1, k1};
                    fusion_Test=X23_test{1, k1};
                    %%%%%%%%%%%%%%%
                    c=cov(fusion_Train);
%                     [U,S,V]=svd(c);
                    [U,D] = eig(c);
                    fusion_Train=(U(1:floor(qq*qq/2)+1,:)*fusion_Train')';
                    fusion_Test=(U(1:floor(qq*qq/2)+1,:)*fusion_Test')';
                    svm1 = fitcsvm(fusion_Train,YYY_train23,'Standardize',true,'KernelFunction','rbf','KernelScale','auto');
                    [Y_predict1,scores] = predict(svm1,fusion_Test);
                    YY23(:,t)=Y_predict1;
                    SVM_scores23(:,:,t)=scores;
                else
                    fusion_Train=[X23_train{1, k1},X23_train{1, k2}];
                    fusion_Test=[X23_test{1, k1},X23_test{1, k2}];
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
        X13_train{1}=DATA_HbO13_train;X13_train{2}=DATA_HbR13_train;X13_train{3}=DATA_HbT13_train;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        X13_test{1}=DATA_HbO13_test;X13_test{2}=DATA_HbR13_test;X13_test{3}=DATA_HbT13_test;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        YY13=[];
        SVM_scores13=[];
        t=0;
        for k1=1:3
            for k2=k1:3
                t=t+1;
                if k1==k2
                    fusion_Train=X13_train{1, k1};
                    fusion_Test=X13_test{1, k1};
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
            M1_P1=reshape(SVM_scores12(kk1,1,:),1,6);
            M1_P1(M1_P1<0)=0;M1_P1(M1_P1>1)=1;
            M1_P2=-reshape(SVM_scores12(kk1,1,:),1,6);
            M1_P2(M1_P2<0)=0;M1_P2(M1_P2>1)=1;
            %%%%%%%%%%%%%%%
            M2_P1=reshape(SVM_scores13(kk1,1,:),1,6);
            M2_P1(M2_P1<0)=0;M2_P1(M2_P1>1)=1;
            M2_P3=-reshape(SVM_scores13(kk1,1,:),1,6);
            M2_P3(M2_P3<0)=0;M2_P3(M2_P3>1)=1;
            %%%%%%%%%%%%%%%
            M3_P2=reshape(SVM_scores23(kk1,1,:),1,6);
            M3_P2(M3_P2<0)=0;M3_P2(M3_P2>1)=1;
            M3_P3=-reshape(SVM_scores23(kk1,1,:),1,6);
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
    save(['fusion_fNIRS_DST_',num2str(qq),'.mat'],'ACC_DST');
    save(['fusion_fNIRS_',num2str(qq),'.mat'],'ACC');
end
clear all






