% clc
% clear
% close all
% N = 12;
% n=0:N-1;
% xn=cos(n*pi/6);
% Xk=fft(xn,N);
% stem(n,Xk);
% xlabel('k');
% ylabel('Xk');
% grid on;


% clear;clc;clf;
% N=16;
% n=0:15;
% xn=[3 0 8 0 1 0 3 0 1 1 0 0 0 0 0 0];
% %xn=[3 0 8 0 1 0 3 0 1 1 12 0 2 0 5 2];
% W=[1 1 1 1;1 -1j -1 1j;1 -1 1 -1;1 1j -1 -1j];
% X1=0.*n;
% for n0=0:3
% X1(n0+1)=W(1,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
% X1(n0+5)=W(2,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
% X1(n0+9)=W(3,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
% X1(n0+13)=W(4,:)*([xn(n0+1),xn(n0+5),xn(n0+9),xn(n0+13)].');
% end
% X2=0.*n;
% for n0=0:3
%     X2(n0+1)=W(1,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
%     cos0=exp(-1i*2*pi/N*n0)
%     cos1=exp(-1i*2*pi/N*2*n0)
%     cos2=exp(-1i*2*pi/N*3*n0)
%     X2(n0+5)=W(2,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
%     cos3=exp(-1i*2*pi/N*n0)
%     cos4=exp(-1i*2*pi/N*2*n0)
%     cos5=exp(-1i*2*pi/N*3*n0)
%     X2(n0+9)=W(3,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
%     X2(n0+13)=W(4,:)*[X1(4*n0+1),X1(4*n0+2)*exp(-1i*2*pi/N*n0),X1(4*n0+3)*exp(-1i*2*pi/N*2*n0),X1(4*n0+4)*exp(-1i*2*pi/N*3*n0)].';
% end
% X=fft(xn);
% 
% figure(1);
% subplot(2,2,1);stem(n,xn,'filled');
% xlabel('n');ylabel('x(n)');
% title('输入序列');grid on;
% subplot(2,2,2);stem(n,abs(X),'filled');
% xlabel('k');ylabel('abs(X(k))');
% title('FFT-幅度谱');grid on;
% subplot(2,2,3);stem(n,real(X),'filled');
% xlabel('k');ylabel('real(X(k))');
% title('FFT-频谱实部');grid on;
% subplot(2,2,4);stem(n,imag(X),'filled');
% xlabel('k');ylabel('imag(X(k))');
% title('FFT-频谱虚部');grid on;
% 
% figure(2);
% subplot(2,2,1);stem(n,abs(X2),'filled');
% xlabel('k');ylabel('abs(X(k)');
% title('16点基-4幅度谱');grid on;
% subplot(2,2,2);stem(n,real(X2),'filled');
% xlabel('k');ylabel('real(X(k)');
% title('16点基-4频谱实部');grid on;
% subplot(2,2,3);stem(n,imag(X2),'filled');
% xlabel('k');ylabel('imag(X(k)');
% title('16点基-4频谱虚部');grid on;


% clc 
% clear
% close all
% fs=2048;%采样频率为1000Hz;
% N=1024;
% t=0:1/fs:N/fs;  
% x=3*cos(2*pi*53*t);      %产生正弦波信号；
% subplot(2,1,1)
% plot(t(1:1000),x(1:1000));   %画出时域内的信号前50个采样点；
% t1=clock;
% for n0=1:10000
% Y=fft(x,N); %对X进行512点的傅立叶变换；
% end
% t2=clock;
% Y1=abs(Y);   %求复数实部与虚部平方和的算术平方根
% Y2=Y1/(N/2);                   %换算成实际的幅度
% f= (0:N)*fs/N;   %设置频率轴（横轴）坐标，1000为采样频率；fs/N是每个采%样点对应的频率，*(0:N)为了让频率从0开始表示。
% subplot(2,1,2)
% plot(f(1:257),Y2(1:257));   %画出频域内的信号
% etime(t2,t1)


clc
x=audioread('C:\Users\CL\Desktop\voice.wav');%读取波形文件获得数据
x=x(1:1024);%取前1024点作为处理使用数据
fx=fft(x);
figure(1);
subplot(211);
plot(x);
subplot(212)
plot(abs(fx));
snr=.3;
x1=x+snr*randn(1,1024);%添加高斯白噪声
fx1=fft(x1);
figure(2);
subplot(211);
plot(x1)
subplot(212);
plot(abs(fx1))

