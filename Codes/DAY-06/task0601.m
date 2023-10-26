% 20 images to BW and save in CSV
pathList = [];
imagesFinalMatrix = zeros(6, (128*128));

SOURCE_FOLDER_PATH = 'sample_photos/';
RESIZED_FOLDER_PATH = 'images_resized/';
GRAY_FOLDER_PATH = 'images_gray/';
BW_FOLDER_PATH = 'images_BW/';
THRESHOLD = 110;
FORMAT = '.png';
IMAGE_COUNT = 6;

for imageIndex = 1:IMAGE_COUNT
    % saving image paths in a list
    imageName = string(imageIndex);
    sourcePath = strcat(SOURCE_FOLDER_PATH,imageName,FORMAT);
    pathList = [pathList, sourcePath];

    % resizing the images to 256x256
    img = imread(sourcePath);
    imgResized = imresize(img, [256 256]);
    resizedPath = strcat(RESIZED_FOLDER_PATH,imageName,FORMAT);
    imwrite(imgResized, resizedPath);

    % converting the images to grayscale
    grayImg = imread(resizedPath);
    grayPath = strcat(GRAY_FOLDER_PATH,imageName,FORMAT);

    redChannel = grayImg(:,:,1);
    greenChannel = grayImg(:,:,2);
    blueChannel = grayImg(:,:,3);

    [imgHeight, imgLength] = size(redChannel);

    grayscaleChannel = zeros(imgHeight, imgLength);
    blackwhiteChannel = zeros(imgHeight, imgLength);

    for i = 1:imgHeight
        for j = 1:imgLength
            grayscaleValue = 0.2989 * redChannel(i,j) + 0.5870 * greenChannel(i,j) + 0.1140 * blueChannel(i,j);
            grayscaleChannel(i, j) = grayscaleValue;
        end
    end
    imwrite(redChannel, grayPath);

    % converting grayscale images to BW
    bwPath = strcat(BW_FOLDER_PATH,imageName,FORMAT);

    for i = 1:imgHeight
        for j = 1:imgLength
            if grayscaleChannel(i, j) < THRESHOLD
                blackwhiteChannel(i, j) = 0;
            else
                blackwhiteChannel(i, j) = 1;
            end
        end
    end

    imwrite(blackwhiteChannel, bwPath);

    % Sub-sampling
    subSampledMatrix = [];

    for outerMatrixRow = 1:2
    	for outerMatrixColumn = 1:2
	    	innerRowStart = (outerMatrixRow - 1) * 128 + 1;
		    innerRowEnd = outerMatrixRow * 128;
		    innerColumnStart = (outerMatrixColumn - 1) * 128 + 1;
		    innerColumnEnd = outerMatrixColumn * 128;

            bwImageRange = blackwhiteChannel(innerRowStart:innerRowEnd, innerColumnStart:innerColumnEnd);
        
		    subSampledMatrix(:, :, imageIndex) = bwImageRange;
        end
    end	

    % converting BW matrix to vector
    bwVector = subSampledMatrix(:, :, imageIndex)';
    bwVector = bwVector(:)';

    % horizontal and vertical profiling
    row = subSampledMatrix(1, :, imageIndex);
    column = subSampledMatrix(:, 1, imageIndex);

    % counting 1(s) in the vector
    oneRowSum = sum(row(:) == 1);
    oneColumnSum = sum(column(:) == 1);
    oneRowSum
    oneColumnSum

    % adding the binary image to a matrix
    imagesFinalMatrix(imageIndex, :) = bwVector;
end
writematrix(imagesFinalMatrix, 'Final Sub-Sampled Matrix.csv');