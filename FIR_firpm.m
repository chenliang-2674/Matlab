clc
clear
close all
N=30;%�˲�������
F=[0 0.4 0.5 1];%Ƶ����Ե
A=[1 1 0 0];%����
B=firpm(N,F,A) ;%��������Ӧ
%figure(1)
% plot(N,B);
% xlabel('ʱ��/������')
% ylabel('����')
NF=512;%Ҫ�����Ƶ������
[H , W]=freqz(B,1,NF) ; %����Ƶ����Ӧ
figure(2)
plot(W/pi,20*log10(abs(H))) ; %����Ƶ����Ӧ
xlabel('��һ��Ƶ��w/pi');
ylabel('��������/dB');