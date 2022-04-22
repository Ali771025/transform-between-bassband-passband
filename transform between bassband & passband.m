close all
% transform between bassband & passband signal with phasor equation
clear all
clc
fs=1000;
t=0:1/fs:10;
fc=200;
x=sinc(t);
subplot(411);
plot(t,x)
[a N]=size(x);
f=-fs/2:fs/(N-1):fs/2;
z=fftshift(fft(x));
subplot(412)
plot(f,abs(z))
y=exp(i*2*pi*fc*t);
d=x.*y;
r=real(d);
subplot(413)
plot(d)
Z=fftshift(fft(d));
subplot(414);
plot(f,abs(Z))
