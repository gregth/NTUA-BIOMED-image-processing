%% Q1
A = imread('UScarotid.cri');
B = A(84:555, 127:687);
B_without_noise = B;
figure(1);
subplot(2, 1, 1);
imshow(A);
subplot(2, 1, 2);
imshow(B);

%% Q2
db = 20
d = 10 ^ (-db / 10);
B= imnoise(B, 'salt & pepper', d);
figure(2);
imshow(B);

%% Q3
mean_filter = fspecial('average', [3 3]);
B_mean = imfilter(B, mean_filter);

B_median = medfilt2(B);

gauss_filter = fspecial('gaussian', [3 3]);
B_gaussian = imfilter(B, gauss_filter, [3 3], 0.8);

B_wiener = wiener2(B);

figure(3);
subplot(2, 2, 1);
imshow(B_mean);

subplot(2, 2, 2);
imshow(B_median);

subplot(2, 2, 3);
imshow(B_gaussian);

subplot(2, 2, 4);
imshow(B_wiener);

mysnr(B_without_noise, B)