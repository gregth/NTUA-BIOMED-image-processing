%% Q1
A = rgb2gray(imread('HumanNuclei.jpg'));

%% Q2
level = graythresh(A);
B = imbinarize(A, level);

%% Q3
edges_sobel = edge(A, 'sobel');
edges_prewit = edge(A, 'prewitt');
edges_zero = edge(A, 'zerocross');
edges_canny = edge(A, 'canny');

%% Q4
figure(1);
subplot(1, 5, 1);
imshow(A);
title('original');

subplot(1, 5, 2);
imshow(edges_sobel);
title('sobel');

subplot(1, 5, 3);
imshow(edges_prewit);
title('prewit');

subplot(1, 5, 4);
imshow(edges_zero);
title('Zero Cross');

subplot(1, 5, 5);
imshow(edges_canny);
title('Canny');

%% Q5

edges_sobel = edge(B, 'sobel');
edges_prewit = edge(B, 'prewitt');
edges_zero = edge(B, 'zerocross');
edges_canny = edge(B, 'canny');

figure(2);
subplot(1, 5, 1);
imshow(B);
title('original');

subplot(1, 5, 2);
imshow(edges_sobel);
title('sobel');

subplot(1, 5, 3);
imshow(edges_prewit);
title('prewit');

subplot(1, 5, 4);
imshow(edges_zero);
title('Zero Cross');

subplot(1, 5, 5);
imshow(edges_canny);
title('Canny');