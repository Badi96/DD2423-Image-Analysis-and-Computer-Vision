function psf = gaussfft(pic, t) 
    % convolution between image and gaussian noise. 
    % t is variance, need to sqrt to get standard deviation
    
    gauss = fspecial('gaussian', size(pic),sqrt(t));
    gausshat = fft2(gauss); % fourier transform
    image = pic;
    imagehat = fft2(image);
    result = gausshat .* imagehat;
  
    result = ifft2(result);
    psf = fftshift(result);


    
end
