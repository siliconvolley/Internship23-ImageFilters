% resize to 30x30 and subsample the matrix
img_RGB = imread('/MATLAB Drive/Day 05/imgRGB.jpg');
imgResized = imresize(img_RGB, [30 30]);

redChannel = imgResized(:,:,1);
greenChannel = imgResized(:,:,2);
blueChannel = imgResized(:,:,3);

[imgHeight, imgLength] = size(redChannel);

grayscaleChannel = zeros(imgHeight, imgLength);
blackwhiteChannel = zeros(imgHeight, imgLength);

% converting RGB to grayscale
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

imwrite(blackwhiteChannel, '/MATLAB Drive/Day 05/imgBW_SubSampled.jpg');

pixelCountMatrix = [];
pixelCountMatrix{1, 1} = 'Matrix No.';
pixelCountMatrix{1, 2} = 'Foreground Pixels';
pixelCountMatrix{1, 3} = 'Background Pixels';
currentInnerMatrix = 1;

% Sub-sampling
subSampledMatrix = [];

for outerMatrixRow = 1:3
	for outerMatrixColumn = 1:3
		innerRowStart = (outerMatrixRow - 1) * 10 + 1;
		innerRowEnd = outerMatrixRow * 10;
		innerColumnStart = (outerMatrixColumn - 1) * 10 + 1;
		innerColumnEnd = outerMatrixColumn * 10;

        bwImageRange = blackwhiteChannel(innerRowStart:innerRowEnd, innerColumnStart:innerColumnEnd);
        
		subSampledMatrix(:, :, outerMatrixRow, outerMatrixColumn) = bwImageRange;
	
        foregroundPixelCount = sum(bwImageRange(:) == 0);
        backgroundPixelCount = sum(bwImageRange(:) == 1);

        pixelCountMatrix{currentInnerMatrix + 1, 1} = currentInnerMatrix;
        pixelCountMatrix{currentInnerMatrix + 1, 2} = foregroundPixelCount;
        pixelCountMatrix{currentInnerMatrix + 1, 3} = backgroundPixelCount;
        
        currentInnerMatrix = currentInnerMatrix + 1;
    end
end	

pixelCountMatrix

% writing in a CSV file
writecell(pixelCountMatrix, 'PixelCountMatrix.csv')
