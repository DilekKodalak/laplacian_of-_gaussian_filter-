clc 
clear

img=double(imread('bike.png'));
tArray=[1,4,16,64];
for i=1:numel(tArray)
    t = tArray(i);
    sigma=sqrt(t);
    Fsize = ceil(sigma*3)*2+1;
    h1 = fspecial('gaussian',[Fsize,Fsize],sigma);
    h2 = fspecial('log',[Fsize,Fsize],sigma);
    filter1 = uint8(imfilter(img,h1,'replicate'));
    filter2 = t * imfilter(img, h2, 'replicate');

    bw = filter2 >=0;
    filter2= uint8(filter2 + 128);
    figure
    subplot(221), imshow(filter1);
    title(sprintf('filtered by Gaussinan, t =%d',t));

    subplot(222), imshow(filter2);
    title(sprintf('filtered by log, t =%d',t));

    subplot(223), imshow(bw);
    title(sprintf('binarized, t =%d',t));
end