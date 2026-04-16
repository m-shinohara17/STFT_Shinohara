clear; close all; clc;

% wavファイル読み込み
[audioSig,fs] = audioread("sig1.wav");
%信号長確保
signalLength = length(audioSig);

% 各種パラメータを定義
windowLength = 4096;%窓長
shiftLength = windowLength / 2;%シフト長


% ゼロパディング
% paddedSig = padarray(padarray(audioSig, windowLength / 2, 0, "pre"), windowLength - 1, 0, "post");
paddedSig = [zeros(windowLength / 2, 1) ; audioSig ; zeros(windowLength - 1, 1)];

%分割数
numFlames =  ceil((windowLength / 2 + signalLength) / shiftLength);
S = zeros(windowLength,numFlames);

win = hann(windowLength);

for i = 1 : numFlames
    startIndex = 1 + (i-1) * shiftLength;
    endIndex = startIndex + windowLength - 1;
    S(:,i) = paddedSig(startIndex : endIndex);    
end

spect = fft(S);




