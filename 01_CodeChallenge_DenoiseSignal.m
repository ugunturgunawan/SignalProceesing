%% Median Filtering and Mean Smooth 
clear; clc;
load denoising_codeChallenge.mat;
%% Median Filter
signal = origSignal;
k = 20;
n = length(signal);
figure(1), clf
histogram(signal,100)

threshold = 10;
suprathresh1 = find( signal>threshold);
suprathresh2 = find( signal<-threshold);
suprathresh = horzcat(suprathresh1,suprathresh2);
filtsig = signal;

k = 20; % window for median
for ti=1:length(suprathresh)
    lowbnd = max(1,suprathresh(ti)-k);
    uppbnd = min(suprathresh(ti)+k,n);
    
    filtsig(suprathresh(ti)) = median(signal(lowbnd:uppbnd));
end
%% mean filtering
k2 = 75;
n2 = length(filtsig);

for i = k2+1:n2-k2-1
    filtsig2(i) = mean(filtsig(i-k2:i+k2));
end

figure(1), clf
subplot(3,1,1);
plot(1:n,signal, 'linew',1);
title('Original Signal');
subplot(3,1,2);
plot(1:n,filtsig, 'linew',1);
title('Signal after Median Filtering')
subplot(3,1,3);
plot(filtsig2, 'linew',2);
title('Signal after Mean Smooth')
sgtitle('Median Filter and Mean Smooth')
zoom on
