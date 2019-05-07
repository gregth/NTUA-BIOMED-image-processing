%% Q1i-iii
A = imread('mammogram.bmp');

Amin = min(A(:));
figure(1);
imshow(A);  
AamxPerCol = max(A);
Amax = max(max(A));
V1 = A(1300, 2020);
V2 = A(2400, 860);
V3 = A(3900, 1500);

%% Q1iv-v
figure(2);
plot(A(1300, :), '-g');
hold on
plot(A(3900, :), '-r');
hold off

Amean = mean(A(:));
Astd = std(double(A(:)));

%% Q1vi
len = 399;
start_row = 2000;

start_col = 400;
Area1 = A(start_row:start_row+len, start_col:start_col+len);
area1std = std(double(Area1(:)));

start_col = 1100;
Area2 = A(start_row:start_row+len, start_col:start_col+len);
area2std = std(double(Area2(:)));

start_col = 1550;
Area3 = A(start_row:start_row+len, start_col:start_col+len);
area3std = std(double(Area3(:)));

figure(4);
subplot(1, 3, 1);
imshow(Area1);
subplot(1, 3, 2);
imshow(Area2);
subplot(1, 3, 3);
imshow(Area3);

%% Q2
round = 1
for level = 0.01:0.05:0.3
    B_bw = imbinarize(A, level);
    subplot(1, 20, round);
    imshow(B_bw);
    title(level);
    round = round + 1;
end

%% Q3
imwrite(B_bw, 'mammogram_output.bmp');