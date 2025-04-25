clear; clc;

% Cria imagem 1000x1000 com valores aleatórios entre 0 e 255
imgAleatoria = uint8(randi([0, 255], 3, 3));

figure;
imshow(imgAleatoria);
title('Imagem');

