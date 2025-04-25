clear; clc;

% Imagem RGB aleatória de 300x300 pixels 
imgRGB = uint8(randi([0, 255], 300, 300, 3));

% Exibir imagem original
figure;
imshow(imgRGB);
title('Imagem RGB Aleatória');

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
