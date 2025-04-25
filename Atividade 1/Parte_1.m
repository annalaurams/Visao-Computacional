clear; clc;

%  Criar imagem branca (100x100) em escala de cinza
img = uint8(255 * ones(100, 100));

figure;
imshow(img);
title('Nome em Escala de Cinza');
hold on;

% Escrever letra na imagem 
text(30, 60, 'Anna', 'Color', 'k', 'FontSize', 50, 'FontWeight', 'bold');
