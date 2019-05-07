%% Q1
A = rgb2gray(imread('HumanNuclei.jpg'));
level = graythresh(A);
B = imbinarize(A, level);

%% Q2
conn = bwlabel(B, 8);
num = max(conn(:));

%% Q3
stats = regionprops(B, 'all');

%% Q4
ecc15 = stats(15).Eccentricity
area1 = stats(1).Area
allAreas = [stats.Area];
meanAll = mean(allAreas)
allEc = [stats.Eccentricity];
maxEx = max(allEc)

allPerimeters = [stats.Perimeter];
minPerimeter = min(allPerimeters);
minIndex = find(allPerimeters == minPerimeter)

%% Q5
statsBright = regionprops(conn, A, 'maxIntensity', 'minIntensity', 'meanIntensity'); 
mean13Intensity = statsBright(13).MeanIntensity
meanMeanInensity = mean([statsBright.MeanIntensity])
stdMeanIntensity = std(double([statsBright.MeanIntensity]))
meanIntensities = [statsBright.MeanIntensity]
maxMeanIndex = find(meanIntensities == max(meanIntensities))