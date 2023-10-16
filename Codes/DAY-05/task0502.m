% Converted Binary Images, must be stored in a CSV file
img = imread('imgRGB.jpg');

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

[imgHeight, imgLength] = size(redChannel);

grayscaleChannel = zeros(imgHeight, imgLength);
blackwhiteChannel = zeros(imgHeight, imgLength);

for i = 1:imgHeight
    for j = 1:imgLength
        grayscaleValue = 0.2989 * redChannel(i,j) + 0.5870 * greenChannel(i,j) + 0.1140 * blueChannel(i,j);
        grayscaleChannel(i, j) = grayscaleValue;
    end
end

% converting grayscale images to BW
for i = 1:imgHeight
    for j = 1:imgLength
        if grayscaleChannel(i, j) < 70
            blackwhiteChannel(i, j) = 0;
        else
            blackwhiteChannel(i, j) = 1;
        end
    end
end

% converting BW matrix to vector
bwVector = blackwhiteChannel';
bwVector = bwVector(:)';

% adding the binary image to a matrix
imagesFinalMatrix(1,:) = bwVector;
writematrix(imagesFinalMatrix, 'Day5_Task2.csv')
