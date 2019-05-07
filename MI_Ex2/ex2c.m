%% Q1
A = rgb2gray(imread('HumanNuclei.jpg'));
figure(1);
imshow(A);

%% Q2
level = graythresh(A);
B = imbinarize(A, level);
figure(2);
imshow(B);

%% Q3
se = strel('disk', 6);
B1 = imerode(B, se);
B2 = imdilate(B, se);
figure(3);
subplot(1, 3, 1);
imshow(B);
subplot(1, 3, 2);
imshow(B1);
subplot(1, 3, 3);
imshow(B2);

%% Q4
sel = strel('sphere', 11);
B4 = imopen(B, sel);
B3 = imclose(B, sel);

figure(4);
subplot(1, 3, 1);
imshow(B);
title('ORIGINAL');

subplot(1, 3, 2);
imshow(B4);
title('OPEN');

subplot(1, 3, 3);
imshow(B3);
title('CLOSE');

%% Q5
str = strel('disk', 1);
edges = imdilate(B, str) - imerode(B, str);
figure(5);
imshow(edges);