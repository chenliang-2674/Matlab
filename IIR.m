clc
clear
close all
[B,A]=ellip(6,0.1,40,0.45) ; %�����Բ�˲���
x=[1,zeros(1,99)]; %������������
h=filter(B,A,x); %�����˲����弤��Ӧ
[H,W]=freqz(B,A,512); %�����˲���Ƶ����Ӧ
figure(1)
plot(W/pi,20*log10(abs(H))) ; %����Ƶ����Ӧ
figure(2)
zplane(B,A); %�����㼫��ͼ