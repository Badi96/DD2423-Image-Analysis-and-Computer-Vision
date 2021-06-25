function [linepar,acc] = houghline(im ,curves, nrho, ntheta, nlines)


[xs, ys] = size(im); % size of an image
pic=pixelplotcurves(im,curves,100); 


theta = ((-90:180/ntheta:90)./180) .* pi;   %theta arrey with step ntheta

D = sqrt(size(pic,1).^2 + size(pic,2).^2);  % max rho
rho = (-D:nrho:D);                          % rho arrey with step ntheta

num_thetas = numel(theta);                  % size of theta arrey
num_rhos = numel(rho);                      % size of rho arrey

HS = zeros(num_rhos, num_thetas);           % declaire Hough space


% Hough transform
for xi = 1:xs
    for yj = 1:ys
        if pic(xi, yj) == 100 
            for theta_index = 1:num_thetas
                th = theta(theta_index);
                r  = xi * cos(th) + yj * sin(th);
                rho_index = round(r + num_rhos/2);                      
                HS(rho_index, theta_index) = HS(rho_index, theta_index) + 1;
            end
        end
    end
end

%HS= binsepsmoothiter(HS, 0.5, 1); %smoothening of HS for finding maxima
acc=HS;

figure
imagesc(theta, rho, acc);
title('Hough Transform');
xlabel('Theta (radians)');
ylabel('Rho (pixels)');
colormap('gray');

[pos ,value] = locmax8(HS);
[dummy ,indexvector] = sort(value);
nmaxima = size(value, 1);

rhon_list=[];
thetan_list=[];

for idx = 1:nlines
    
    rhoidxacc = pos(indexvector(nmaxima - idx + 1), 1);
    thetaidxacc = pos(indexvector(nmaxima - idx + 1), 2);
    hold on
    plot(theta(thetaidxacc), rho(rhoidxacc),'o');
    
    rhon_list=[rhon_list rhoidxacc];
    thetan_list=[thetan_list thetaidxacc];

end

linepar{1}=rhon_list;
linepar{2}=thetan_list;


end