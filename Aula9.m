clc, clear;

a = imread('./img.jpg');
figure(1), imshow(a), title('Imagem Original');

% Filtro Laplaciano

h1 = fspecial("laplacian");
ah1 = imfilter(a, h1);
figure(2), imshow(ah1), title('Imagem filtro laplaciano');

% Filtro Gaussiano

h2 = fspecial("gaussian");
ah2 = imfilter(a, h2);
figure(3), imshow(ah2), title('Imagem filtro gaussiano');

h3 = fspecial("sobel");
ah3 = imfilter(a, h3);
figure(4), imshow(ah3), title('Imagem filtro Sobel');

b = rgb2gray(a);
borda = edge(b);
figure(5), imshow(borda), title('extração de borda');


se = strel("disk", 5);      % Cria elemento estruturante em forma de disco com raio 5
bd = imopen(b, se);         % Aplica abertura morfológica na imagem b (em tons de cinza)
figure(6), imshow(bd), title('morfologica');

