function [t_weight,s_weight]=bilinear_CSP(X,Labels)
%
%
%
[classes, bar, labels] = unique(Labels);
[H,I]=find(Labels==classes(1));
X1=X(H,:,:);
[H,I]=find(Labels==classes(2));
X2=X(H,:,:);
[XX1,XX2,XX3]=size(X1);

%%%%%%%%%%%%%%%%%%%%5
%%%% n=XX2,  t=XX3;
W=rand(XX2,10);
V=rand(XX3,10);
SS=[0,0];
for k=1:1000
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% extract spatial %%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %计算每个trial标准化后的协方差矩阵
    trialCov1 = zeros(XX2,XX2,XX1);
    for t=1:XX1
        E1 = reshape(X1(t,:,:),XX2,XX3);
        EE = E1*V*V'*E1';
        trialCov1(:,:,t) = EE./ trace(EE);
    end
    clear E;
    clear EE;
    %计算每个trial标准化后的协方差矩阵
    trialCov2 = zeros(XX2,XX2,XX1);
    for t=1:XX1
        E1 = reshape(X2(t,:,:),XX2,XX3);
        EE = E1*V*V'*E1';
        trialCov2(:,:,t) = EE./ trace(EE);
    end
    clear E;
    clear EE;
    %总的协方差矩阵
    covTotal = mean(trialCov1,3)+mean(trialCov2,3);
    [W Dt1] = eig(covTotal); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%  extract time   %%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %计算每个trial标准化后的协方差矩阵
    trialCov1 = zeros(XX3,XX3,XX1);
    for t=1:XX1
        E1 = reshape(X1(t,:,:),XX2,XX3)';
        EE = E1*W*W'*E1';
        trialCov1(:,:,t) = EE./ trace(EE);
    end
    clear E;
    clear EE;
    %计算每个trial标准化后的协方差矩阵
    trialCov2 = zeros(XX3,XX3,XX1);
    for t=1:XX1
        E1 = reshape(X2(t,:,:),XX2,XX3)';
        EE = E1*W*W'*E1';
        trialCov2(:,:,t) = EE./ trace(EE);
    end
    clear E;
    clear EE;
    %总的协方差矩阵
    covTotal = mean(trialCov1,3)+mean(trialCov2,3);
    [V Dt2] = eig(covTotal); 
    if SS(1)==Dt1(1,1)||SS(2)==Dt2(1,1)
        t_weight=V;
        s_weight=W;
        break;
    else
        SS=[Dt1(1),Dt2(1)];
    end
end
D1=sum(Dt1);
D2=sum(Dt2);
[H1,I1]=sort(D1,'descend');
[H2,I2]=sort(D2,'descend');
t_weight=V(:,I2);
s_weight=W(:,I1);






















