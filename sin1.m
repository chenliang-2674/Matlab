clc
clear 
close all
fs=100; %采样频率 
N=128; %采样总点数 
n=0:N-1; %各个采样点 
f0=10; %正弦信号频率 
t=n/fs; %1/fs是采样周期，采样了128此，相对应得采样时刻 
x=sin(2*pi*f0*t); %生成正弦信号
figure
plot(t,x);
xlabel('时间/s');
ylabel('幅值');
title('时域的波形');
grid on;