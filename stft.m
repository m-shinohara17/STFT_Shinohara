clear; close all; clc;

% wavファイル読み込み
[audioSig,fs] = audioread("sig1.wav");
%信号長確保
signalLength = length(audioSig);

% 各種パラメータを定義
windowLength = 4096; %窓長
shiftLength = windowLength / 2;%シフト長

% ゼロパディング
paddedSig = [zeros(windowLength / 2, 1) ; audioSig ; zeros(windowLength - 1, 1)];

%分割数
numFlames =  ceil((windowLength / 2 + signalLength) / shiftLength);
%行列をあらかじめ用意
S = zeros(windowLength,numFlames);

%行列に波形を格納
for i = 1 : numFlames
    startIndex = 1 + (i-1) * shiftLength;
    endIndex = startIndex + windowLength - 1;
    S(:,i) = paddedSig(startIndex : endIndex);    
end

win = hann(windowLength);%窓用意
winS = win .* S; %窓かけ
spect = fft(winS); %dft
ampSpect = abs(spect);%絶対値を取得
powerSpect = 20 * log10(ampSpect);%利得に変換

freqAxis = linspace(0, fs, windowLength);%縦軸(周波数)取得
timeAxis = linspace(0, signalLength/fs, numFlames);%横軸(時間)取得



imagesc (timeAxis, freqAxis, powerSpect); %グラフ表示
axis xy;%y軸を上下反転
c = colorbar;
c.Label.String = ("利得[db]");

xlabel("時間[s]");
ylabel("周波数[Hz]")

ylim([0, fs/2]);



