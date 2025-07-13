clc; clear;

a = imread('../img.jpg');

% Como a imagem é colorida, converte para escala de cinza
if size(a, 3) == 3
    a = rgb2gray(a);
end

figure;
imshow(a), title('Imagem Original');

% a) Filtro Sobel (passa-alta) 

figure;
subplot(1,3,1), imshow(edge(a, 'sobel')), title('Sobel padrão');
subplot(1,3,2), imshow(edge(a, 'sobel', 0.02)), title('Sobel threshold 0.02');
subplot(1,3,3), imshow(edge(a, 'sobel', 0.1, 'vertical')), title('Sobel vertical threshold 0.1');

% b) Filtro Average (passa-baixa) 

h1 = fspecial('average', 3);
h2 = fspecial('average', 5);
h3 = fspecial('average', 9);

avg1 = imfilter(a, h1);
avg2 = imfilter(a, h2);
avg3 = imfilter(a, h3);

figure;
subplot(1,3,1), imshow(avg1), title('Average 3x3');
subplot(1,3,2), imshow(avg2), title('Average 5x5');
subplot(1,3,3), imshow(avg3), title('Average 9x9');

% c) Filtro Gaussiano (passa-baixa) 

g1 = fspecial('gaussian', [3 3], 0.5);
g2 = fspecial('gaussian', [5 5], 1);
g3 = fspecial('gaussian', [9 9], 2);

gauss1 = imfilter(a, g1);
gauss2 = imfilter(a, g2);
gauss3 = imfilter(a, g3);

figure;
subplot(1,3,1), imshow(gauss1), title('Gaussiano 3x3, σ=0.5');
subplot(1,3,2), imshow(gauss2), title('Gaussiano 5x5, σ=1');
subplot(1,3,3), imshow(gauss3), title('Gaussiano 9x9, σ=2');
