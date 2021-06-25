function dx = deltax(f,rows,columns)
%UNTITLED Summary of this function goes here
%   function dx = deltax(f,row,column)
%   Calculate appriximation of image (one step ahead) derivarive in x direction.
%   row corresponds to the y axis and column the x-axis.
dx = zeros(256,256);
for row = 1:rows
    for column = 1:columns
        dx(row,column) = f(row,column+1) - f(row,column);
    end
end
%dx = dx_temp;
end

