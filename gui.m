%% 蒙特卡洛仿真模拟无GUI程序代码
clear 
clc
N =10000;%随机模拟的次数
RisklessRate = 0.0306;%无风险利率即银行利率来自9年平均值
BorrowRate   = 0.055;%贷款利率取约定值
RiskAversion = 39.8;%取厌恶系数平均值
%M期望 E为sigma
ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
sigma =[0.05 0.01 0.05 0.01];%根据对未来的预期，分别给股票、债券、基金和房产赋予一个sigma
S_M = ExpReturn(1);%股票
S_E = sigma(1);%正态分布标准差
B_M = ExpReturn(2);%债券
B_E = sigma(2);
F_M = ExpReturn(3);%基金
F_E = sigma(3);
H_M = ExpReturn(4);%房产
H_E = sigma(4);
%生成服从正态分布的随机数
S = normrnd(S_M,S_E,N,1);
B = normrnd(B_M,B_E,N,1);
F = normrnd(F_M,F_E,N,1);
H = normrnd(H_M,H_E,N,1);

for i=1:N
	ExpReturns=[S(i) B(i) F(i) H(i)];
% 	set(handles.edit13,'string',S(i));
% 	set(handles.edit16,'string',B(i));
% 	set(handles.edit19,'string',F(i));
% 	set(handles.edit22,'string',H(i));
	ExpCovariance=[0.264	-0.01	0.273	0.025
                     -0.01	0.002	-0.013	-0.002
                     0.273	-0.013	0.318	0.028
                     0.025	-0.002	0.028	0.005 ];
            %协方差
	[PortRisk,PortReturn,PortWts]=portopt(ExpReturns,ExpCovariance,20);
	[RiskyRisk,RiskyReturn,RiskyWts,RiskyFraction,OverallRisk,OverallReturn]=portalloc(PortRisk,PortReturn,PortWts,RisklessRate,BorrowRate,RiskAversion);
	RiskWeights=RiskyWts*RiskyFraction
    %show(i,:)=[OverallRisk OverallReturn]
	S1(i) = RiskWeights(1);
	B1(i) = RiskWeights(2);
	F1(i) = RiskWeights(3);
	H1(i) = RiskWeights(4);
    RiskWeights1(i,:)=RiskWeights;
    RiskyWts1(i,:)=RiskyWts;
    RiskyReturn1(i)=RiskyReturn;
    RiskyRisk1(i)=RiskyRisk;
    RiskyFraction1(i)=RiskyFraction;
	OverallRisk1(i) = OverallRisk;
	OverallReturn1(i) = OverallReturn;
end
%% 频率图绘制
n=100;%数据分成的份数,即条形图的宽度

figure
%subplot(2,2,1)
S2=hist(S1,n+1);
x1=min(S1):((max(S1)-min(S1))/n):max(S1);
bar(x1,S2,'b')
title('股票')
%subplot(2,2,2)
figure
B2=hist(B1,n+1);
x2=min(B1):((max(B1)-min(B1))/n):max(B1);
bar(x2,B2,'b')
title('债券')
%subplot(2,2,3)
figure
F2=hist(F1,n+1);
x3=min(F1):((max(F1)-min(F1))/n):max(F1);
bar(x3,F2,'b')
title('基金')
%subplot(2,2,4)
figure
H2=hist(H1,n+1);
x4=min(H1):((max(H1)-min(H1))/n):max(H1);
bar(x4,H2,'b')
title('房产')

figure
%subplot(1,2,1);
Oturn2=hist(OverallReturn1,n+1);
x5=min(OverallReturn1):((max(OverallReturn1)-min(OverallReturn1))/n):max(OverallReturn1);
bar(x5,Oturn2,'b')
title('收益')
%subplot(1,2,2)
figure
OverallRisk2=hist(OverallRisk1,n+1);
x6=min(OverallRisk1):((max(OverallRisk1)-min(OverallRisk1))/n):max(OverallRisk1);
bar(x6,OverallRisk2,'b')
title('风险')



% handles.S= S1;
% handles.B= B1;
% handles.F= F1;
% handles.H= H1;
% handles.OverallRisk = OverallRisk;
% handles.OverallReturn = OverallReturn;
% guidata(hObject, handles);
