function [segmentations,centers] = kmeans_segm(image,k, L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% RGB = imread('tiger1.jpg');
% colorcloud(RGB,'rgb');
%ima=imread(image);
ima = image;
%size(ima)
[rows, columns, colour] = size(ima);
ima = double(ima);
%ima_rgb = colorcloud(ima,'rgb'); % image in rgb format
segmentations = zeros(rows, columns); % 1-k. Storing index of cluster for which pixel are member of. 
centers = zeros(k, 3); % position (colour) of center of the K clusters. 
%imavector = reshape(ima, rows*columns, 3); % change format of image to 2D

for K_temp = 1:k % initializing the random centers
    centers(K_temp, :) = [255.*rand(1,1), 255.*rand(1,1), 255.*rand(1,1)]; % center of each colour clusters 
end

for interations = 1:L
    %find closest center for each pixel
    for i = 1:rows
        for j = 1:columns
            c = sqrt(( (ima(i,j,1)-centers(:,1)).^2 + (ima(i,j,2)-centers(:,2)).^2)+(ima(i,j,3)-centers(:,3)).^2);
            a = find(c==min(c)); % index of the closest index for cluster to the point 
            segmentations(i,j) = a;
        end
    end
    
    for K_temp = 1:k
        
        member = ismember(segmentations, K_temp);
        [r_temp, c_temp] = find(member); % find all indecies for the clustetr 
        temp_red = 0;
        temp_blue = 0;
        temp_green = 0; 
        
        for i = 1:length(r_temp)
            temp_red = ima(r_temp(i), c_temp(i), 1) + temp_red;
            temp_blue = ima(r_temp(i), c_temp(i), 2) + temp_blue;
            temp_green = ima(r_temp(i), c_temp(i), 3) + temp_green;
        end
       
        centers(k,:) = [temp_red/(length(r_temp)), temp_blue/length(r_temp), temp_green/length(r_temp)];
    end
    
    
end


end

