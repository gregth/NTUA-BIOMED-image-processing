%% Q1
A = imread('mammogram.bmp');
B = imresize(A, 0.2);
I = imcrop(A);
J = A(1900:2800, 900:1500);
figure(1);
subplot(2, 1, 1);
imshow(A);
subplot(2, 1, 2);
imshow(J);
BASE = imrotate(B, 90);

%% Q2
figure(2);
imhist(A);
A_adj = imadjust(A, [60/255 200/255], []);
imshow(A_adj);
figure(3);
subplot(2, 1, 1);
imshow(A);
subplot(2, 1, 2);
imshow(A_adj);

%% Q3
figure(4);
A = imread('Carotid_colorDoppler.jpg');
subplot(1, 3, 1);
imhist(A(:, :, 1));
title('RED');

subplot(1, 3, 2);
imhist(A(:, :, 2));
title('GREEN');

subplot(1, 3, 3);
imhist(A(:, :, 3));
title('BLUE');

A_adj = imadjust(A, [0.5 0.5 0.5; 1 1 1])
figure(5);
imshow(A_adj);
figure(3);
subplot(2, 1, 1);
imshow(A);
subplot(2, 1, 2);
imshow(A_adj);
