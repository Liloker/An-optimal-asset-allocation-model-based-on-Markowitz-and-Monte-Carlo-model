%%在之前的基础上，根据协方差进一步计算20种最优组合
clear
ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
ExpCovariance=[0.264	-0.01	0.273	0.025
                -0.01	0.002	-0.013	-0.002
                0.273	-0.013	0.318	0.028
                0.025	-0.002	0.028	0.005 ];
             %协方差
[PortRisk,PortReturn,PortWts ]=portopt(ExpReturn,ExpCovariance,20)
plot(PortRisk,PortReturn,'-b.')
title('均值一方差有效前沿以及各个资产组合风险与收益')
xlabel('风险 (标准差)')
ylabel('期望收益率')
hold off
figure
x=[1:20];
plot(x,PortReturn,'-bs')
hold on
plot(x,PortRisk,'-r^')
hold on
xlabel('组合')
ylabel('%')
legend('期望收益率','标准差')
title('投资组合的期望收益率与标准差')

