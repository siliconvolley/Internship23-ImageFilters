% To separate RGB channels
img = imread("puppyyyyyyy.jpg");

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

[imgHeight, imgLength] = size(redChannel);

fprintf('Red Channel:\n');
%redChannel
fprintf('Green Channel:\n');
%greenChannel
fprintf('Blue Channel:\n');
%blueChannel
