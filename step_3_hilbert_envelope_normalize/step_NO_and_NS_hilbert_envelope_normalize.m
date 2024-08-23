%%
A=load('ERSP_theta_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('ERSP_theta_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('ERSP_theta_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:62
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:62
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:62
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
ERSP_theta_1=L1;
ERSP_theta_2=L2;
ERSP_theta_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('ERSP_alpha_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('ERSP_alpha_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('ERSP_alpha_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:62
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:62
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:62
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
ERSP_alpha_1=L1;
ERSP_alpha_2=L2;
ERSP_alpha_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('ERSP_beta_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('ERSP_beta_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('ERSP_beta_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:62
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:62
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:62
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
ERSP_beta_1=L1;
ERSP_beta_2=L2;
ERSP_beta_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('ERSP_gamma_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('ERSP_gamma_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('ERSP_gamma_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:62
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:62
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:62
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
ERSP_gamma_1=L1;
ERSP_gamma_2=L2;
ERSP_gamma_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA_ERSP_theta=zeros(540,62,1500);
DATA_ERSP_alpha=zeros(540,62,1500);
DATA_ERSP_beta=zeros(540,62,1500);
DATA_ERSP_gamma=zeros(540,62,1500);
t=0;
for k=1:3:540
    t=t+1;
    DATA_ERSP_theta(k,:,:)=ERSP_theta_1(t,:,:);
    DATA_ERSP_theta(k+1,:,:)=ERSP_theta_2(t,:,:);
    DATA_ERSP_theta(k+2,:,:)=ERSP_theta_3(t,:,:);
    DATA_ERSP_alpha(k,:,:)=ERSP_alpha_1(t,:,:);
    DATA_ERSP_alpha(k+1,:,:)=ERSP_alpha_2(t,:,:);
    DATA_ERSP_alpha(k+2,:,:)=ERSP_alpha_3(t,:,:);
    DATA_ERSP_beta(k,:,:)=ERSP_beta_1(t,:,:);
    DATA_ERSP_beta(k+1,:,:)=ERSP_beta_2(t,:,:);
    DATA_ERSP_beta(k+2,:,:)=ERSP_beta_3(t,:,:);
    DATA_ERSP_gamma(k,:,:)=ERSP_gamma_1(t,:,:);
    DATA_ERSP_gamma(k+1,:,:)=ERSP_gamma_2(t,:,:);
    DATA_ERSP_gamma(k+2,:,:)=ERSP_gamma_3(t,:,:);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('DATA_ERSP_theta.mat','DATA_ERSP_theta');
save('DATA_ERSP_alpha.mat','DATA_ERSP_alpha');
save('DATA_ERSP_beta.mat','DATA_ERSP_beta');
save('DATA_ERSP_gamma.mat','DATA_ERSP_gamma');
clear all;
%%
A=load('coh_theta_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('coh_theta_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('coh_theta_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:378
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:378
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:378
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
coh_theta_1=L1;
coh_theta_2=L2;
coh_theta_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('coh_alpha_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('coh_alpha_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('coh_alpha_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:378
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:378
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:378
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
coh_alpha_1=L1;
coh_alpha_2=L2;
coh_alpha_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('coh_beta_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('coh_beta_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('coh_beta_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:378
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:378
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:378
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
coh_beta_1=L1;
coh_beta_2=L2;
coh_beta_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('coh_gamma_items_1.mat');
L1=A.DATA;
z=hilbert(L1); 
L1=abs(z);%abs
A=load('coh_gamma_items_3.mat');
L2=A.DATA;
z=hilbert(L2); 
L2=abs(z);%abs
A=load('coh_gamma_items_5.mat');
L3=A.DATA;
z=hilbert(L3); 
L3=abs(z);%abs
AA=L1;
for k1=1:180
    for k2=1:378
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:378
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:378
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,1500),'range',[-1,1]);
    end
end
coh_gamma_1=L1;
coh_gamma_2=L2;
coh_gamma_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA_coh_theta=zeros(540,378,1500);
DATA_coh_alpha=zeros(540,378,1500);
DATA_coh_beta=zeros(540,378,1500);
DATA_coh_gamma=zeros(540,378,1500);
t=0;
for k=1:3:540
    t=t+1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    DATA_coh_theta(k,:,:)=coh_theta_1(t,:,:);
    DATA_coh_theta(k+1,:,:)=coh_theta_2(t,:,:);
    DATA_coh_theta(k+2,:,:)=coh_theta_3(t,:,:);
    DATA_coh_alpha(k,:,:)=coh_alpha_1(t,:,:);
    DATA_coh_alpha(k+1,:,:)=coh_alpha_2(t,:,:);
    DATA_coh_alpha(k+2,:,:)=coh_alpha_3(t,:,:);
    DATA_coh_beta(k,:,:)=coh_beta_1(t,:,:);
    DATA_coh_beta(k+1,:,:)=coh_beta_2(t,:,:);
    DATA_coh_beta(k+2,:,:)=coh_beta_3(t,:,:);
    DATA_coh_gamma(k,:,:)=coh_gamma_1(t,:,:);
    DATA_coh_gamma(k+1,:,:)=coh_gamma_2(t,:,:);
    DATA_coh_gamma(k+2,:,:)=coh_gamma_3(t,:,:);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('DATA_coh_theta.mat','DATA_coh_theta');
save('DATA_coh_alpha.mat','DATA_coh_alpha');
save('DATA_coh_beta.mat','DATA_coh_beta');
save('DATA_coh_gamma.mat','DATA_coh_gamma');
clear all;