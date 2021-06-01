%%引入无风险资产后的资产配置
clear
%X=15;
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
for X=15:5:110
%风险厌恶系数范围放在[15 55],大于60无意义
    RiskAversion=X;
    %风险厌恶系数是一个变量X
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
%% 20个不同风险厌恶系数对应的资产组合期望收益率，标准差散点图
x=15:5:110;
plot(x,OverallRisk_0,'-rs')
hold on
plot(x,OverallReturn_0,'-b^')
title('20个不同风险厌恶系数对应的资产组合期望收益率，标准差散点图')
xlabel('风险厌恶系数A')
legend('资产组合标准差','资产组合期望收益率')
%% 风险资产权重图
figure
plot(x,RiskyFraction_0,'-gs')
xlabel('风险厌恶系数A')
title('20个不同风险厌恶系数对应的风险资产权重散点图')
