close all
% transform passband signal to baseband signal
clear all
clc
fc=200;
fs=1000;
t=0:1/fs:10;
x=sinc(t).*cos(2*pi*fc*t);
q=hilbert(x);
xi=(x.*cos(2*pi*fc*t))+(q.*(sin(2*pi*fc*t)));
xq=x.*(-sin(2*pi*fc*t))+(q.*(cos(2*pi*fc*t)));
xx=xi+xq;
subplot(211);
plot(t,abs(xx));
[a N]=size(x);
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(xx));
subplot(212);
plot(f,abs(z))
