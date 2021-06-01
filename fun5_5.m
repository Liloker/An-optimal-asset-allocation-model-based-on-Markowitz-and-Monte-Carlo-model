%% 最大、平均和最小风险厌恶系数下的家庭资产最优组合
%%引入无风险资产后的资产配置
clear
X=[52.8 39.8 17.6];%分别对应最大、平均和最小风险厌恶系数
ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
ExpCovariance=[0.264	-0.01	0.273	0.025
                -0.01	0.002	-0.013	-0.002
                0.273	-0.013	0.318	0.028
                0.025	-0.002	0.028	0.005 ];
            %协方差
[PortRisk,PortReturn,PortWts]=portopt(ExpReturn,ExpCovariance,20);
%标准差 期望收益率 分配权重
RisklessRate=0.0306;
%这里无风险利率=银行利率
BorrowRate=0.055;
%借贷利率，根据最新的人民币贷款利率，一年(含)以内的年利率为5.10%,一年至五年(含)的年利率为5.50%，
%五年以上的年利率为5.65%，则本文将贷款利率定为5.50%。
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
%无风险投资比重，即银行存款比重
OverallRisk_0
OverallReturn_0
%风险产品权重计算
RiskyWts_00(1,:)=RiskyWts_0(1,:).*RiskyFraction_0(1);
RiskyWts_00(2,:)=RiskyWts_0(2,:).*RiskyFraction_0(2);
RiskyWts_00(3,:)=RiskyWts_0(3,:).*RiskyFraction_0(3)


