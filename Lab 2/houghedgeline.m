function [linepar,acc] =houghedgeline(pic, scale, threshold, nrho, ntheta, nlines, gradmagnthreshold)

curves = extractedge(pic, scale, threshold, 'same'); %detect edges

pic_sm=gaussfft(pic,0.5);
magnitude=Lv(pic_sm, 'valid');

[linepar,acc] = houghline(pic,curves, nrho, ntheta, nlines, gradmagnthreshold,magnitude); % calculating Haugh space and lines

theta = ((-90:180/ntheta:90)./180) .* pi;   %theta arrey with step ntheta

D = sqrt(size(pic,1).^2 + size(pic,2).^2);  % max rho
rho = (-D:nrho:D);                          % rho arrey with step ntheta

figure
showgrey(pic)




figure
im_sm=gaussfft(pic,1);
gr=Lv(im_sm, 'valid');
imagesc(gr);
colormap(gray);
hold on;

rhon_list=linepar{1};
thetan_list=linepar{2};
for i = 1:length(rhon_list)
    th = theta(thetan_list(i));
    rh = rho(rhon_list(i));
    m = -(cos(th)/sin(th));
    b = rh/sin(th);
    x = 1:size(pic,1);
    plot(m*x+b, x,'m');
    hold on;
end

end