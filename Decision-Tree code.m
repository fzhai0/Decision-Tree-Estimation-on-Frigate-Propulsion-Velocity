
%�������ƽ����������ݶ��봢��

a = randperm(1030);
TrainSet = navalpropulsiondata(a(1:16000),:); %ǰ16000������Ϊѵ����
TestSet = navalpropulsiondata(a(16001:16400),:); %��400������Ϊ������

Varia_Train = TrainSet(:,1:17); %ǰ17�����ݷֱ�Ϊ�ƽ���װ�õ�17�����
Deci_Train = TrainSet(:,18); %������Ϊ����������ж�ָ�������ݣ��ڱ�����Ϊ�ƽ��ٶ�
%��18/19/20��
%�����б��ֱ�����ƽ����ٶȵ����ַ��෽ʽ���ڴ˴���Ҫ�ֱ���е������

P_Test = TestSet(:,1:17);
T_Test = TestSet(:,18); 
%ͬѵ�������˴�Ϊ���Լ�

ctree = ClassificationTree.fit(Varia_Train,Deci_Train);
%��ϳ���������

view(ctree); %�鿴��������ѧ����
view(ctree,'mode','graph'); %���ƾ�����

T_sim = predict(ctree, P_test);%�Ծ��������з������

count_B = length(find(Deci_Train == 1)); %�������
count_M = length(find(Deci_Train == 2));
rate_B = count_B / 500;
rate_M = count_M / 500;
total_B = length(find(data(:,2)==1));
total_M = length(find(data(:,2)==2));
number_B = length(find(T_Test==1));
number_M = length(find(T_Test==2));
number_B_sim = length(find(T_sim==1 & T_test==1));
number_M_sim = length(find(T_sim==2 & T_test==2));

