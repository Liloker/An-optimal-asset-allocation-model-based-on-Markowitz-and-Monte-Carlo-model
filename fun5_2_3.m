%% 5.2.3 ���ֲ�Ʒ���ǽ��׳ɱ���Ͷ��������
clear,clc
syms beta_stock1 beta_stock2 beta_stock3 beta_bond beta_fund beta_house
%���׷����ǽ��׶��beta��
%beta_stock1 =0.0073026
%�����ò���2006��Ĺ�Ʊ���׷���
beta_stock2 =0.0113026
beta_stock3 =0.0063026
beta_bond   =0.0025
beta_fund   =0.0151
beta_house  =0.035 
% rΪ�����ǽ��׳ɱ���������
%r��Ȼ��λ��%�������ڹ�ʽ�б���Ҫ��ΪС�����������
r_stock=[96.66 -65.39 79.98 -14.31 -21.68 3.17 -6.75 52.87 -5.62 ]./100;
r_bond =[ 0.03  10.45  0.14   1.96   5.10 3.67 -0.29 10.34  8.18 ]./100;
r_fund =[145.79 -48.86 84.60  7.67 -22.98 7.91  4.34 32.85 20.54 ]./100;
r_house=[14.76  -1.66 23.19   7.50   6.85 7.70  7.70  1.38  7.42 ]./100;
%RΪ���ǽ��׳ɱ���������
%R_stock1=((1-beta_stock1)/(1+beta_stock1)).*r_stock()-((2*beta_stock1)/(1+beta_stock1))
R_stock2=((1-beta_stock2)/(1+beta_stock2)).*r_stock(1)-((2*beta_stock2)/(1+beta_stock2));
R_stock3=((1-beta_stock3)/(1+beta_stock3)).*r_stock(2:9)-((2*beta_stock3)/(1+beta_stock3));
R_stock =[R_stock2 R_stock3];
R_bond  =((1-beta_bond)/(1+beta_bond)).*r_bond(1:9)-((2*beta_bond)/(1+beta_bond));
R_fund  =((1-beta_fund)/(1+beta_fund)).*r_fund(1:9)-((2*beta_fund)/(1+beta_fund));
R_house =((1-beta_house)/(1+beta_house)).*r_house(1:9)-((2*beta_house)/(1+beta_house));
%Ϊ�˺ÿ���
R=[R_stock;R_bond;R_fund;R_house]'
%��ͼ
figure
x=[2007:2015];
plot(x,R_stock,'blue','LineWidth',2)
hold on
plot(x,R_bond,'red','LineWidth',2)
hold on
plot(x,R_fund,'green','LineWidth',2)
hold on
plot(x,R_house,'m','LineWidth',2)
title('���ַ�����ƹ���Ͷ��������(�����׳ɱ�)')
xlabel('���')
ylabel('�����ʣ������׳ɱ�����λ:%')
legend('��Ʊ','ծȯ','����','����')
grid on
