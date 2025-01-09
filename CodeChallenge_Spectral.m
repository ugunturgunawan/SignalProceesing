clear; clc;
load spectral_codeChallenge.mat;
%%
figure;
plot(time,signal);
title('Time-domain Signal');
%% FFT
fs = srate;
n = length(signal);
hz = linspace(0,fs/2,floor(n/2)+1);
signalpower = abs(fft(signal)/n).^2;
figure;
plot(hz,signalpower(1:length(hz)),'linew',2);
xlabel('Frequency (Hz)'), ylabel('Magnitude');
title('FFT');
%% PSD
[pxx,f] = pwelch(signal,srate,srate/2,0:0.1:srate/2,srate);
figure;
semilogx(f,pxx);
xlabel('Frequency (Hz)'), ylabel('Magnitude')
title('PSD');
%% Spectrogram
[s,f,t] = spectrogram(signal,hann(1000),[],[],fs);
figure;
imagesc(time,f,abs(s).^2)
axis xy
xlabel('Time (sec.)'), ylabel('Frequency (Hz)')
set(gca,'clim',[0.1 1]*65000,'ylim',f([1 dsearchn(f(:),40)]));
title('Spectrogram');
colormap hot