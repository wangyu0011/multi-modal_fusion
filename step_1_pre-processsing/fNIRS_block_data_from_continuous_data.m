%%
%%%%%%%%%%%  session 1 %%%%%%%%%%%%%%%%
central1=[3666,13583;977,3456;1077,13474;...% 1
    3548,6027;3543,6022;1149,3628;...% 3
    3541,13458;1072,10989;5789,10748];% 5
central3=[1187,11104;10894,13374;3556,8513;...% 1
    8507,10986;1064,8502;6108,8587;...% 3
    6020,8500;6031,13469;3309,13227];% 5
central5=[6145,8624;5936,8415;6035,10994;...% 1
    1069,13466;10980,13460;11067,13546;...% 3
    1061,10979;3552,8510;830,8268];% 5
%%
pre=407;
post=2035;
%%%%%%%%%%%
PATH1='/.../';
PATH2='/.../';
PATH3='/.../';
PATH='/.../';
for s=1:90
    try
        load([PATH,'HbT',num2str(s),'.mat']);
        i=1;
        X=HbT(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_1_1item.mat'],'X');
        clear X
        X=HbT(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_1_3item.mat'],'X');
        clear X
        X=HbT(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_1_5item.mat'],'X');
        clear X
        %%%%
        i=2;
        X=HbT(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_2_1item.mat'],'X');
        clear X
        X=HbT(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_2_3item.mat'],'X');
        clear X
        X=HbT(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH3,'HbT',num2str(s),'_2_5item.mat'],'X');
        clear X
    catch
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    try
        load([PATH,'HbO',num2str(s),'.mat']);
        i=1;
        X=HbO(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_1_1item.mat'],'X');
        clear X
        X=HbO(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_1_3item.mat'],'X');
        clear X
        X=HbO(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_1_5item.mat'],'X');
        clear X
        %%%%
        i=2;
        X=HbO(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_2_1item.mat'],'X');
        X=HbO(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_2_3item.mat'],'X');
        X=HbO(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH1,'HbO',num2str(s),'_2_5item.mat'],'X');
    catch
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    try
        load([PATH,'HbR',num2str(s),'.mat']);
        i=1;
        X=HbR(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_1_1item.mat'],'X');
        clear X
        X=HbR(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_1_3item.mat'],'X');
        clear X
        X=HbR(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_1_5item.mat'],'X');
        clear X
        %%%%
        i=2;
        X=HbR(central1(s,i)-pre:central1(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_2_1item.mat'],'X');
        clear X
        X=HbR(central3(s,i)-pre:central3(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_2_3item.mat'],'X');
        clear X
        X=HbR(central5(s,i)-pre:central5(s,i)+post,:);
        save([PATH2,'HbR',num2str(s),'_2_5item.mat'],'X');
        clear X
    catch
        
    end
end
%%
























