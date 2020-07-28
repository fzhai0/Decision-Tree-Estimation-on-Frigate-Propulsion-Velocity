
%将导入推进器参数数据读入储存

a = randperm(1030);
TrainSet = navalpropulsiondata(a(1:16000),:); %前16000组数据为训练组
TestSet = navalpropulsiondata(a(16001:16400),:); %后400组数据为测试组

Varia_Train = TrainSet(:,1:17); %前17组数据分别为推进器装置的17组参数
Deci_Train = TrainSet(:,18); %该数据为决策树最后判定指标性数据，在本文中为推进速度
%或（18/19/20）
%后三列表格分别代表推进器速度的三种分类方式，在此处需要分别进行导入测试

P_Test = TestSet(:,1:17);
T_Test = TestSet(:,18); 
%同训练集，此处为测试集

ctree = ClassificationTree.fit(Varia_Train,Deci_Train);
%拟合初级决策树

view(ctree); %查看决策树数学分类
view(ctree,'mode','graph'); %绘制决策树

T_sim = predict(ctree, P_test);%对决策树进行仿真测试

count_B = length(find(Deci_Train == 1)); %分析结果
count_M = length(find(Deci_Train == 2));
rate_B = count_B / 500;
rate_M = count_M / 500;
total_B = length(find(data(:,2)==1));
total_M = length(find(data(:,2)==2));
number_B = length(find(T_Test==1));
number_M = length(find(T_Test==2));
number_B_sim = length(find(T_sim==1 & T_test==1));
number_M_sim = length(find(T_sim==2 & T_test==2));

