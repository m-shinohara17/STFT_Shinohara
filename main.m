clear; close all; clc;
%各種パラメータ定義、calcSTFTから呼び出し、グラフの表示
%引数は「audioLength」,「fs」「windowLength」,「shiftLength」,
%「windowType」,「drawSpect」返り値はS

% 変数の定義
inputFileName = "sig1.wav";
windowLength = 4096;
shiftLength = windowLength / 2;
% スペクトログラムの表示のON/OFF
drawSpect = false;
% 窓関数の定義 
% 方形窓，ハン窓，ハミング窓，ブラックマン窓をrec,hann,hamming,blackmanと定義
windowType ="blackman"; 


[audioSig,fs] = audioread(inputFileName); % 音声ファイルから変数の取り出し

% 関数の呼び出し
calcSTFT (audioSig, fs, windowLength, shiftLength, windowType, drawSpect);