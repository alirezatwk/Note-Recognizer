clear all;
clc;

Pic = imread('CarrierLine5.png');


BW = im2bw(Pic);
BW = imclearborder(BW);


Si = strel('disk',2);
%Si = strel('arbitrary', NoteSi);
ErodedSiBW = imerode(BW,Si);

Si2 = strel('line',5,15);
ErodedSiBW2 = imerode(ErodedSiBW,Si2);
imshow(ErodedSiBW);

SSi = regionprops(ErodedSiBW2,'Centroid');

figure;
imshow(BW);
hold on
for k = 1:numel(SSi)

   scatter(SSi(k).Centroid(:,1), SSi(k).Centroid(:,2),50,'filled');

end

Se = strel('disk',2);
ErodedSeBW = imerode(BW,Se);

Se2 = strel('line',5,15);
ErodedSeBW2 = imerode(ErodedSeBW,Se2);

SSe = regionprops(ErodedSeBW2,'Centroid');

figure;
imshow(BW);
hold on
for k = 1:numel(SSe)

   scatter(SSe(k).Centroid(:,1), SSe(k).Centroid(:,2),30,'filled');

end