% To Print the foreground pixel count and background pixel count
imgBW = imread('imgBW.jpg');

foregroundPixelCount = sum(imgBW(:) == 1);
backgroundPixelCount = sum(imgBW(:) == 0);

fprintf('Total Foreground pixels: %d\n', foregroundPixelCount);
fprintf('Total Background pixels: %d\n', backgroundPixelCount);
