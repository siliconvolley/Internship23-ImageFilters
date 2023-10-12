% Applying Edge detection methods

img = imread('images_rgb/3.jpg'); 

grayImage = rgb2gray(img);


sobelEdges = edge(grayImage, 'sobel');
prewittEdges = edge(grayImage, 'prewitt');
cannyEdges = edge(grayImage, 'canny');
logEdges = edge(grayImage, 'log');

% Display the original image and the edge detection results
subplot(2, 2, 1), imshow(sobelEdges), title('Sobel');
subplot(2, 2, 2), imshow(prewittEdges), title('Prewitt');
subplot(2, 2, 3), imshow(cannyEdges), title('Canny');
subplot(2, 2, 4), imshow(logEdges), title('LoG');


imwrite(sobelEdges, 'edge_detection_images/sobel_edges.jpg');
imwrite(prewittEdges, 'edge_detection_images/prewitt_edges.jpg');
imwrite(cannyEdges, 'edge_detection_images/canny_edges.jpg');
imwrite(logEdges, 'edge_detection_images/log_edges.jpg');

