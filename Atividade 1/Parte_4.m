clear; clc;

imgRGB = imread('./ny.jpg');

% Exibir imagem
figure;
imshow(imgRGB);
title('Imagem Original - ny.png');

% Separar canais
R = imgRGB(:,:,1);
G = imgRGB(:,:,2);
B = imgRGB(:,:,3);

R = cat(3, R, zeros(size(R), 'uint8'), zeros(size(R), 'uint8'));

G = cat(3, zeros(size(G), 'uint8'), G, zeros(size(G), 'uint8'));
B = cat(3, zeros(size(B), 'uint8'), zeros(size(B), 'uint8'), B);

figure;
imshow(R);
title('Canal Vermelho');

figure;
imshow(G);
title('Canal Verde');

figure;
imshow(B);
title('Canal Azul');
