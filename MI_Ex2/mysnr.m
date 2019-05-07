function [n] = mysnr(signal,noisy)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
noise = noisy - signal;
l = sum(sum(signal .^ 2)) / sum(sum(noise .^ 2));
n = 10 * log10(l);
end

