% 20 images to BW and save in CSV
pathList = [];
imagesFinalMatrix = zeros(20, (225*225));

SOURCE_FOLDER_PATH = 'sample_photos/';
RESIZED_FOLDER_PATH = 'images_resized/';
GRAY_FOLDER_PATH = 'images_gray/';
BW_FOLDER_PATH = 'images_BW/';
THRESHOLD = 120;
FORMAT = '.jpg';

for imageIndex = 1:20
    % saving image paths in a list
    imageName = string(imageIndex);
    sourcePath = strcat(SOURCE_FOLDER_PATH,imageName,FORMAT);
    pathList = [pathList, sourcePath];

    % resizing the images to 225x225
    img = imread(sourcePath);
    imgResized = imresize(img, [225 225]);
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

    % converting BW matrix to vector
    bwVector = blackwhiteChannel';
    bwVector = bwVector(:)';

    % adding the binary image to a matrix
    imagesFinalMatrix(imageIndex,:) = bwVector;
    writematrix(imagesFinalMatrix, 'matrix.csv')
end