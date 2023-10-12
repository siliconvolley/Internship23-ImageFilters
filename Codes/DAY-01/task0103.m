% To convert RGB to grayscale
img_RGB = imread("puppyyyyyyy.jpg");
img_Grayscale = rgb2gray(img_RGB);
imshow(img_Grayscale)
imwrite(img_Grayscale, "puppy_grayscale(rgb2gray).jpg")