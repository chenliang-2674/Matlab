%����һ���ȷֲ��İ������ź�u(n)�������䲨�Σ���������ֲ����
clc
clear
close all
N=50000;          %u(n)�ĳ���
u=rand(1,N);      %����rand���õ����ȷֲ���α�����u(n)
u_mean=mean(u);   %��u(n)�ľ�ֵ��mean��MATLAB��m�ļ�
power_u=var(u);   %��u(n)�ķ���
subplot(211)
plot(u(1:100));   %plot��������������
grid on;          %��ͼ�μ�����
ylabel('u(n)')    %Y�����Ϊu(n)
subplot(212)
hist(u,50);       %��u(n)��ֱ��ͼ,50�Ƕ�u(n)ȡֵ��Χ(0~1)���ֽ��ϸ����
grid on;
ylabel('histogram of u(n)');


