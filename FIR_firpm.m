clc
clear
close all
N=30;%滤波器阶数
F=[0 0.4 0.5 1];%频带边缘
A=[1 1 0 0];%增益
B=firpm(N,F,A) ;%计算冲击响应
%figure(1)
% plot(N,B);
% xlabel('时间/样本数')
% ylabel('幅度')
NF=512;%要计算的频率数量
[H , W]=freqz(B,1,NF) ; %计算频率响应
figure(2)
plot(W/pi,20*log10(abs(H))) ; %画出频率响应
xlabel('归一化频率w/pi');
ylabel('对数幅度/dB');