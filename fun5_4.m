%%�����޷����ʲ�����ʲ�����
clear
%X=15;
ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
ExpCovariance=[0.264	-0.01	0.273	0.025
                -0.01	0.002	-0.013	-0.002
                0.273	-0.013	0.318	0.028
                0.025	-0.002	0.028	0.005 ];
            %Э����
[PortRisk,PortReturn,PortWts]=portopt(ExpReturn,ExpCovariance,20);
%��׼�� ���������� ����Ȩ��
RisklessRate=0.0306;
%�����޷�������=��������
BorrowRate=0.055;
%������ʣ��������µ�����Ҵ������ʣ�һ��(��)���ڵ�������Ϊ5.10%,һ��������(��)��������Ϊ5.50%��
%�������ϵ�������Ϊ5.65%�����Ľ��������ʶ�Ϊ5.50%��
RiskyRisk_0    =[];
RiskyReturn_0  =[];
RiskyWts_0     =[];
RiskyFraction_0=[];
OverallRisk_0  =[];
OverallReturn_0=[];
for X=15:5:110
%�������ϵ����Χ����[15 55],����60������
    RiskAversion=X;
    %�������ϵ����һ������X
    [RiskyRisk,RiskyReturn,RiskyWts,RiskyFraction,OverallRisk,OverallReturn]=portalloc(PortRisk,PortReturn,PortWts,RisklessRate,BorrowRate,RiskAversion)
    RiskyRisk_0    =[RiskyRisk_0;RiskyRisk];
    RiskyReturn_0  =[RiskyReturn_0;RiskyReturn];
    RiskyWts_0     =[RiskyWts_0;RiskyWts];
    RiskyFraction_0=[RiskyFraction_0;RiskyFraction];
    OverallRisk_0  =[OverallRisk_0;OverallRisk];
    OverallReturn_0=[OverallReturn_0;OverallReturn];
end
RiskyRisk_0
RiskyReturn_0
RiskyWts_0
RiskyFraction_0
OverallRisk_0
OverallReturn_0
%% 20����ͬ�������ϵ����Ӧ���ʲ�������������ʣ���׼��ɢ��ͼ
x=15:5:110;
plot(x,OverallRisk_0,'-rs')
hold on
plot(x,OverallReturn_0,'-b^')
title('20����ͬ�������ϵ����Ӧ���ʲ�������������ʣ���׼��ɢ��ͼ')
xlabel('�������ϵ��A')
legend('�ʲ���ϱ�׼��','�ʲ��������������')
%% �����ʲ�Ȩ��ͼ
figure
plot(x,RiskyFraction_0,'-gs')
xlabel('�������ϵ��A')
title('20����ͬ�������ϵ����Ӧ�ķ����ʲ�Ȩ��ɢ��ͼ')
