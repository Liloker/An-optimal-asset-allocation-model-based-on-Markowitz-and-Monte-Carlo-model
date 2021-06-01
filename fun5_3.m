%% 均值一方差有效前沿以及各个资产组合风险与收益
%期望收益率
Returns=[ 11.58	3.87	22.02	0.99 ]./100;
%标准差
STDs=[ 51.40	4.34	56.36	6.71 ]./100;
%相关系数矩阵
Correlations=[    1     -0.445	0.941	0.712
                -0.445    1     -0.533	-0.764
                0.941	-0.533	1	0.735
                0.712	-0.764	0.735	1   ]; 
Covariances=corr2cov(STDs,Correlations)
portopt(Returns,Covariances,20);
hold on
rand('state',0);
Weights=rand(1000,4);
Total=sum(Weights,2);
Weights(:,1)=Weights(:,1)./Total;
Weights(:,2)=Weights(:,2)./Total;
Weights(:,3)=Weights(:,3)./Total;
Weights(:,4)=Weights(:,4)./Total;
[PortRisk,PortReturn]=portstats(Returns,Covariances,Weights);
plot(PortRisk,PortReturn,'.r')
title('均值一方差有效前沿以及各个资产组合风险与收益')
xlabel('风险 (标准差)')
ylabel('期望收益率')
hold on
