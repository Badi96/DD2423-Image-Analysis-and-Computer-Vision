K = 7;               % number of clusters used
L = 22;              % number of iterations
seed = 14;           % seed used for random initialization
scale_factor = 1.0;  % image downscale factor
image_sigma = 1.0;   % image preblurring scale

I = imread('orange.jpg');
I = imresize(I, scale_factor);
Iback = I;
d = 2*ceil(image_sigma*2) + 1;
h = fspecial('gaussian', [d d], image_sigma);
I = imfilter(I, h);

tic
[segm, centers ] = kmeans_segm(Iback, 6, 15);
toc
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);
%imwrite(Inew,'result/kmeans1.png')
%imwrite(I,'result/kmeans2.png')

subplot(2,3,1)
imshow(Iback)
title('original')

subplot(2,3,2)
imshow(Inew)
title("cluster K= 6 ")

subplot(2,3,3)
imshow(I)
title("Divided into subpixles (overlay)")


tic
[segm, centers ] = kmeans_segm(Iback, 7, 25);
toc
Inew = mean_segments(Iback, segm);
I = overlay_bounds(Iback, segm);

subplot(2,3,4)
imshow(Iback)
title('original')

subplot(2,3,5)
imshow(Inew)
title("cluster K= 4")

subplot(2,3,6)
imshow(I)
title("Divided into subpixles (overlay)")

