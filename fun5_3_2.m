%%��֮ǰ�Ļ����ϣ�����Э�����һ������20���������
clear
ExpReturn=[ 11.58	3.87	22.02	0.99 ]./100;
ExpCovariance=[0.264	-0.01	0.273	0.025
                -0.01	0.002	-0.013	-0.002
                0.273	-0.013	0.318	0.028
                0.025	-0.002	0.028	0.005 ];
             %Э����
[PortRisk,PortReturn,PortWts ]=portopt(ExpReturn,ExpCovariance,20)
plot(PortRisk,PortReturn,'-b.')
title('��ֵһ������Чǰ���Լ������ʲ���Ϸ���������')
xlabel('���� (��׼��)')
ylabel('����������')
hold off
figure
x=[1:20];
plot(x,PortReturn,'-bs')
hold on
plot(x,PortRisk,'-r^')
hold on
xlabel('���')
ylabel('%')
legend('����������','��׼��')
title('Ͷ����ϵ��������������׼��')

