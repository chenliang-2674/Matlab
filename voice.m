clc
clear
close all
fs=22050;
x1=audioread('C:\Users\CL\Desktop\voice.wav');  %ԭʼ�����ź�
%sound(x1,22050);
x1=x1(1:1024);
y1=fft(x1,1024);
f=fs*(0:1024)/1024;
subplot(221);
plot(x1);
title('ԭʼ�����ź�');
subplot(222);
plot(abs(y1(1:1024)));
title('ԭʼ�����ź�FFTƵ��');
% freqz(x1);%����ԭʼ�����źŵ�Ƶ����Ӧͼ
% subplot(223);
% plot(f);
t=0:1/fs:(length(x1)-1)/fs;
%  A=0.005;
%  d=[A*sin(2*pi*5500*t)]';
 snr=.1;
 x2=x1+snr*randn(1,1024);%��Ӹ�˹������
 %x2=x1+d;
 subplot(223);
 plot(t,x2);
 title('��������������ź�');
 y2=fft(x2,1024);
 subplot(224);
plot(abs(y2(1:1024)));
title('��������������ź�FFTƵ��');