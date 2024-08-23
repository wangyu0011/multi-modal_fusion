%%
A=load('HbR_items_1.mat');
L1=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L1(:,k1,:),180,622).*reshape(L1(:,k2,:),180,622);
    end
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L1(:,k3,:),180,622);
end
L1=AA;
z=hilbert(L1); 
KKK1=abs(z);
A=load('HbR_items_3.mat');
L2=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L2(:,k1,:),180,622).*reshape(L2(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L2(:,k3,:),180,622);
end
L2=AA;
z=hilbert(L2); 
KKK2=abs(z);
A=load('HbR_items_5.mat');
L3=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L3(:,k1,:),180,622).*reshape(L3(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L3(:,k3,:),180,622);
end
L3=AA;
z=hilbert(L3); 
KKK3=abs(z);
%%%%%%%%%%%%%%%%%%%
%%%%
L1=KKK1;
L2=KKK2;
L3=KKK3;
AA=L1;
for k1=1:180
    for k2=1:171
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:171
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:171
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
HbR_1=L1;
HbR_2=L2;
HbR_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('HbO_items_1.mat');
L1=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L1(:,k1,:),180,622).*reshape(L1(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L1(:,k3,:),180,622);
end
L1=AA;
z=hilbert(L1); 
KKK1=abs(z);
A=load('HbO_items_3.mat');
L2=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L2(:,k1,:),180,622).*reshape(L2(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L2(:,k3,:),180,622);
end
L2=AA;
z=hilbert(L2); 
KKK2=abs(z);
A=load('HbO_items_5.mat');
L3=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L3(:,k1,:),180,622).*reshape(L3(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L3(:,k3,:),180,622);
end
L3=AA;
z=hilbert(L3); 
KKK3=abs(z);
L1=KKK1;
L2=KKK2;
L3=KKK3;
AA=L1;
for k1=1:180
    for k2=1:171
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:171
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:171
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
HbO_1=L1;
HbO_2=L2;
HbO_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=load('HbT_items_1.mat');
L1=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L1(:,k1,:),180,622).*reshape(L1(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L1(:,k3,:),180,622);
end
L1=AA;
z=hilbert(L1); 
KKK1=abs(z);
A=load('HbT_items_3.mat');
L2=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L2(:,k1,:),180,622).*reshape(L2(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L2(:,k3,:),180,622);
end
L2=AA;
z=hilbert(L2); 
KKK2=abs(z);
A=load('HbT_items_5.mat');
L3=(A.DATA(:,:,:));
AA=zeros(180,171,622);
t=0;
for k1=1:17
    for k2=k1+1:18
        t=t+1;
        AA(:,t,:)=reshape(L3(:,k1,:),180,622).*reshape(L3(:,k2,:),180,622);
    end
    
end
for k3=1:18
    AA(:,153+k3,:)=reshape(L3(:,k3,:),180,622);
end
L3=AA;
z=hilbert(L3); 
KKK3=abs(z);
L1=KKK1;
L2=KKK2;
L3=KKK3;
AA=L1;
for k1=1:180
    for k2=1:171
        L1(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L2;
for k1=1:180
    for k2=1:171
        L2(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
AA=L3;
for k1=1:180
    for k2=1:171
        L3(k1,k2,:) = normalize(reshape(AA(k1,k2,:),1,622),'range',[-1,1]);
    end
end
HbT_1=L1;
HbT_2=L2;
HbT_3=L3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA_HbR=zeros(540,171,622);
DATA_HbO=zeros(540,171,622);
DATA_HbT=zeros(540,171,622);
t=0;
for k=1:3:540
    t=t+1;
    DATA_HbO(k,:,:)=HbO_1(t,:,:);
    DATA_HbO(k+1,:,:)=HbO_2(t,:,:);
    DATA_HbO(k+2,:,:)=HbO_3(t,:,:);
    DATA_HbR(k,:,:)=HbR_1(t,:,:);
    DATA_HbR(k+1,:,:)=HbR_2(t,:,:);
    DATA_HbR(k+2,:,:)=HbR_3(t,:,:);
    
    DATA_HbT(k,:,:)=HbT_1(t,:,:);
    DATA_HbT(k+1,:,:)=HbT_2(t,:,:);
    DATA_HbT(k+2,:,:)=HbT_3(t,:,:);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('DATA_HbR.mat','DATA_HbR');
save('DATA_HbO.mat','DATA_HbO');
save('DATA_HbT.mat','DATA_HbT');
clear all;







