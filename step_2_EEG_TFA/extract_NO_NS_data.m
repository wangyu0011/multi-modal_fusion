%%
PATH1='/.../EEG_data/block_data/TF_back_0/';
PATH2='/.../EEG_data/block_data/';
cd(PATH1);
band1=1:4;%theta
band2=5:9;%alpha
band3=12:27;%beta
band4=28:42;%gamma
list=dir('*.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),28,900);
for k=1:length(list)
    A=load(list(k).name);
    A1=abs(reshape(mean(A.DATA(:,band1,:),2),28,900));
    for t=1:28
        DATA(k,t,:)=A1(t,:)-mean(A1(t,1:90));
    end
end
save([PATH2,'ERSP_theta_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),28,900);
for k=1:length(list)
    A=load(list(k).name);
    A1=abs(reshape(mean(A.DATA(:,band2,:),2),28,900));
    for t=1:28
        DATA(k,t,:)=A1(t,:)-mean(A1(t,1:90));
    end
end
save([PATH2,'ERSP_alpha_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),28,900);
for k=1:length(list)
    A=load(list(k).name);
    A1=abs(reshape(mean(A.DATA(:,band3,:),2),28,900));
    for t=1:28
        DATA(k,t,:)=A1(t,:)-mean(A1(t,1:90));
    end
end
save([PATH2,'ERSP_beta_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),28,900);
for k=1:length(list)
    A=load(list(k).name);
    A1=abs(reshape(mean(A.DATA(:,band4,:),2),28,900));
    for t=1:28
        DATA(k,t,:)=A1(t,:)-mean(A1(t,1:90));
    end
end
save([PATH2,'ERSP_gamma_back_0.mat'],'DATA');
%%
PATH1='/.../EEG_data/block_data/coh_back_0/';
PATH2='/.../EEG_data/block_data/';
cd(PATH1);
band1=1:4;%theta
band2=5:9;%alpha
band3=12:27;%beta
band4=28:42;%gamma
list=dir('*.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),378,900);
for k=1:length(list)
    A=load(list(k).name);
    DATA(k,:,:)=reshape(mean(A.DATA(:,band1,:),2),378,900);
end
save([PATH2,'coh_theta_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),378,900);
for k=1:length(list)
    A=load(list(k).name);
    DATA(k,:,:)=reshape(mean(A.DATA(:,band2,:),2),378,900);
end
save([PATH2,'coh_alpha_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),378,900);
for k=1:length(list)
    A=load(list(k).name);
    DATA(k,:,:)=reshape(mean(A.DATA(:,band3,:),2),378,900);
end
save([PATH2,'coh_beta_back_0.mat'],'DATA');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA=zeros(length(list),378,900);
for k=1:length(list)
    A=load(list(k).name);
    DATA(k,:,:)=reshape(mean(A.DATA(:,band4,:),2),378,900);
end
save([PATH2,'coh_gamma_back_0.mat'],'DATA');
%%




























