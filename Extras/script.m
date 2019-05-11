%% EROTIMA 1
I = imread('carotid.tif');

% Prokeitai gia RGB eikona .tif, enw ta dedomena tis eikonas einai 
% typoy unsigned integer 8bit

%% EROTIMA 2
I2 = rgb2gray(I);

val1 = I2(195, 405) % 3 - (sxedon) MAVRO
val2 = I2(298, 268) % 213 - (sxedon) LEFKO
val3 = I2(334, 198) % 81 - GKRI

minIntensity = min(I2(:)) % ELAXXISTI 0
maxIntensity = max(I2(:)) % MEGISTI 246

%% EROTISI 3 
A = imnoise(I2, 'salt & pepper', 0.1);
figure(1);
subplot(1, 2, 1);
imshow(I2);
title('I2');
subplot(1, 2, 2);
imshow(A);
title('A');

%% EROTISI 4
figure(2);
subplot(1, 2, 1);
imhist(I2);
title('Histogram for I2');
subplot(1, 2, 2);
imhist(A);
title('Histogram for A');

% An paratirisoume diakrika sta istogrammata stis akraies times toy kathe
% plot, dialdi se aftes poy antistoixoyn se xrwma total black - timi 0
% kai se 255 - total white, sto istogramma tis eikonas A i sixnotita
% emfanisis ton timon aftwn (0 kai 255) exei afksithei ragdaia. Afto
% ofeiletai sto gegonos oti o throivos salt and pepper isagi pliros lefka
% (255) i pliros mavra pixels (0), diladi o thorivos aftos einai mono
% mpavra kai lefka pixel

%% EROTISI 5
avg_filter= fspecial('average', [4 4]);
I2_average_filter = imfilter(A, avg_filter);
I2_median_filter = medfilt2(A, [4 4]);

figure(3);
subplot(1, 3, 1);
imshow(I2);
title('I2');
subplot(1, 3, 2);
imshow(I2_average_filter);
title('With average filter');
subplot(1, 3, 3);
imshow(I2_median_filter);
title('With median filter');

% I apothorivopoiisi me ti xrisi tis endiamesis timis eiani simantika kaliteri
% apo tin texniki tou mesou orou (logo tou oti einai apallagmeni apo tis gkri 
% kilides pou prokiptoun apo ton meso oro ton geitonikon perioxon stin
% texniki mesou orou)

%% EROTISI 6
figure(4);
plot(I2(:, 300));

% Dedomenou tou oti o avlos exei skouro xroma eno to tixoma lefko, apo to
% diagramma istogrammatos mporoume na simperanoume oti o ta zitoumena
% oria einai XONDRIKA metaksi 165 kai 295, kathos se afta perikleietai metaksi
% fotinis perioxis skoura perioxi.

%% ERITISI 7
B = I2(165:295, :);
figure(5);
subplot(1, 2, 1);
imshow(I2);
subplot(1, 2, 2);
imshow(B);

%% EROTISI 8
thr = graythresh(B);
Bthr = imbinarize(B, thr);
figure(6);
subplot(1, 2, 1);
imshow(B);
subplot(1, 2, 2);
imshow(Bthr);

% to apotelesma den einai toso ikanopoiitiko
% parakato piramtatzimai me diaforetikes times
figure(7);
i = 1;
for level = [0.2 0.5 0.9]
    subplot(3, 1, i);
    imshow(imbinarize(B, level));
    title(level);
    i = i + 1;
end

% Apo tis parapnw times, opws vlepoume sto figure 7, i timi 2 dinei to
% kalitero apotelesma
C = imbinarize(B, 0.2);

%% EROTISI 9
se = strel('rectangle', [15 40]);
Cclosed = imclose(C, se);
figure(8);
subplot(1, 2, 1);
imshow(C);
title('C');
subplot(1, 2, 2);
imshow(Cclosed);
title('Cclosed');

% Paratiroume oti o telestis gemizei tixon opes kai kena simeia stis
% perioxes poy antistoixoun sta toixomata kai omalopoiei (smooth) tis akmes
% poy iparxoun stin perioxi ton tixomaton

%% EROTISI 10
D = edge(Cclosed, 'sobel');
figure(9);
subplot(1, 2, 1);
imshow(B);
title('B');
subplot(1, 2, 2);
imshow(D);
title('D');

%% EROTISI 11
E = not(Cclosed);

%% EROTISI 12
labels = bwlabel(E, 4);

props = regionprops(labels);
larger_area = max([props.Area]) % Emvadon avlou

%% EROTISI 13
imwrite(D, 'boundary.bmp', 'bmp');
imwrite(E, 'lumen.bmp', 'bmp');