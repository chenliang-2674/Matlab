clc
clear
close all
fs=22050;
x1=audioread('C:\Users\CL\Desktop\voice.wav');  %原始语音信号
%sound(x1,22050);
x1=x1(1:1024);
y1=fft(x1,1024);
f=fs*(0:1024)/1024;
subplot(221);
plot(x1);
title('原始语音信号');
subplot(222);
plot(abs(y1(1:1024)));
title('原始语音信号FFT频谱');
% freqz(x1);%绘制原始语音信号的频率响应图
% subplot(223);
% plot(f);
t=0:1/fs:(length(x1)-1)/fs;
%  A=0.005;
%  d=[A*sin(2*pi*5500*t)]';
 snr=.1;
 x2=x1+snr*randn(1,1024);%添加高斯白噪声
 %x2=x1+d;
 subplot(223);
 plot(t,x2);
 title('加噪声后的语音信号');
 y2=fft(x2,1024);
 subplot(224);
plot(abs(y2(1:1024)));
title('加噪声后的语音信号FFT频谱');