clc
clear 
close all
fs=100; %����Ƶ�� 
N=128; %�����ܵ��� 
n=0:N-1; %���������� 
f0=10; %�����ź�Ƶ�� 
t=n/fs; %1/fs�ǲ������ڣ�������128�ˣ����Ӧ�ò���ʱ�� 
x=sin(2*pi*f0*t); %���������ź�
figure
plot(t,x);
xlabel('ʱ��/s');
ylabel('��ֵ');
title('ʱ��Ĳ���');
grid on;