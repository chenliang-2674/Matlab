%产生一均匀分布的白噪声信号u(n)，画出其波形，并检验其分布情况
clc
clear
close all
N=50000;          %u(n)的长度
u=rand(1,N);      %调用rand，得到均匀分布的伪随机数u(n)
u_mean=mean(u);   %求u(n)的均值，mean是MATLAB的m文件
power_u=var(u);   %求u(n)的方差
subplot(211)
plot(u(1:100));   %plot用来画连续曲线
grid on;          %给图形加网格
ylabel('u(n)')    %Y轴标题为u(n)
subplot(212)
hist(u,50);       %画u(n)的直方图,50是对u(n)取值范围(0~1)所分解的细胞数
grid on;
ylabel('histogram of u(n)');


