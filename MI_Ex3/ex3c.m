%% Q1
A = rgb2gray(imread('S6.jpg'));
B = rgb2gray(imread('S8.jpg'));

%% Q2
figure(1);
subplot(1, 2, 1);
imshow(A);
title('S6');
subplot(1, 2, 2);
imshow(B);
title('S8');

%% Q3
I_A = imcrop(A);
I_B = imcrop(B);

%% Q4
figure(2);
subplot(1, 2, 1);
imhist(I_A);
title('S6');
subplot(1, 2, 2);
imhist(I_B);
title('S8');

% ??????????? ??? ? S6 ???? ??????????? ?????? ??? ??? ? S8


%% Q5
minA= min(I_A(:));
maxA = max(I_A(:));
meanA = mean(I_A(:));
medA = median(I_A(:));
stdA = std(double(I_A(:)));

minB= min(I_B(:));
maxB = max(I_B(:));
meanB = mean(I_B(:));
stdB = std(double(I_B(:)));

%% Q6
grcoA = graycomatrix(I_A);
propsA = graycoprops(grcoA);
grcoB = graycomatrix(I_A);
propsB = graycoprops(grcoA);