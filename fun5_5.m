%% ���ƽ������С�������ϵ���µļ�ͥ�ʲ��������
%%�����޷����ʲ�����ʲ�����
clear
X=[52.8 39.8 17.6];%�ֱ��Ӧ���ƽ������С�������ϵ��
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
for i=1:3
    RiskAversion=X(i);
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
RiskyFraction_00  =1-RiskyFraction_0
%�޷���Ͷ�ʱ��أ������д�����
OverallRisk_0
OverallReturn_0
%���ղ�ƷȨ�ؼ���
RiskyWts_00(1,:)=RiskyWts_0(1,:).*RiskyFraction_0(1);
RiskyWts_00(2,:)=RiskyWts_0(2,:).*RiskyFraction_0(2);
RiskyWts_00(3,:)=RiskyWts_0(3,:).*RiskyFraction_0(3)


