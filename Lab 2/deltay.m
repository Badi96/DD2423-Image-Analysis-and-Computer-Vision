function dy = deltay(f,rows,columns)
%UNTITLED Summary of this function goes here
%   function dy = deltax(f,row,column)
%   Calculate appriximation of image (one step ahead) derivarive in y direction.
%   row corresponds to the y axis and column the x-axis.
dy = zeros(256,256);
for column = 1:columns
    for row = 1:rows
        dy(row,column) = f(row+1, column) - f(row, column);

    end
end
end

