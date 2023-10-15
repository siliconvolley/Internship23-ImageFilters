% To convert handwritten image to black and white
img = imread('camera_shots/handwritten_input.jpg');

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

[imgHeight, imgLength] = size(redChannel);

grayscaleChannel = zeros(imgHeight, imgLength);
blackwhiteChannel = zeros(imgHeight, imgLength);


% For grayscale conversion
for i = 1:imgHeight
    for j = 1:imgLength
        grayscaleValue = 0.2989 * redChannel(i,j) + 0.5870 * greenChannel(i,j) + 0.1140 * blueChannel(i,j);
        grayscaleChannel(i, j) = grayscaleValue;
    end
end

% For black and white conversion
for i = 1:imgHeight
    for j = 1:imgLength
        if grayscaleChannel(i, j) < 140
            blackwhiteChannel(i, j) = 0;
        else
            blackwhiteChannel(i, j) = 1;
        end
    end
end

%fprintf('Grayscale Channel:\n');
%grayscaleChannel

imshow(blackwhiteChannel, [])
imwrite(blackwhiteChannel, 'camera_shots/handwritten_output.jpg');
