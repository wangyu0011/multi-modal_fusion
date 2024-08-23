%%
list_ch=1:28;
PATH1='/.../EEG_data/block_data/TF_back_0/';
PATH2='/.../EEG_data/block_data/coh_back_0/';
cd(PATH1);
for t1=1:26
    for t2=1:3
        for t3=1:3
            try
                clear DATA;
                A=load([PATH1,num2str(t1),'-',num2str(t2),'_block_',num2str(t3),'.mat']);
                A2=(A.DATA);
                AAA=zeros(378,42,900);
                t=0;
                for k1=1:27
                    sig1=reshape(A2(list_ch(k1),:,:),42,900);
                    for k2=k1+1:28
                        sig2=reshape(A2(list_ch(k2),:,:),42,900);
                        t=t+1;
                        A3=zeros(42,900);
                        for w1=1:42
                            A4=zeros(1,900);
                            for w2=1:900
                                coherresout=sig1(w1,w2).*conj(sig2(w1,w2));
                                coh1=abs(coherresout);
                                A4(w2)=coh1;    
                            end
                            A3(w1,:)=A4-mean(A4(1:90));
                        end
                        AAA(t,:,:)=A3;
                    end
                end             
                DATA=AAA;
                save([PATH2,num2str(t1),'-',num2str(t2),'_block_',num2str(t3),'.mat'],'DATA');
            catch
                
            end
        end
    end
end






