%% Q1
A = phantom();
figure(1);
imshow(A);

%% Q2 
degrees = 0:10:170;
radons = radon(A, degrees);

%% Q3
figure(2);
imagesc(radons);

%% Q4
recover = iradon(radons, degrees);
figure(3);
subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(recover);