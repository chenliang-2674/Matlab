clc
clear
close all
[B,A]=ellip(6,0.1,40,0.45) ; %设计椭圆滤波器
x=[1,zeros(1,99)]; %产生输入脉冲
h=filter(B,A,x); %产生滤波器冲激响应
[H,W]=freqz(B,A,512); %产生滤波器频率响应
figure(1)
plot(W/pi,20*log10(abs(H))) ; %画出频率响应
figure(2)
zplane(B,A); %生成零极点图