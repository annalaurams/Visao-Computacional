clear; clc;

% imagem 3x3 com valores aleatórios entre 0 e 255

imgAleatoria = uint8(randi([0, 255], 3, 3));

imgHorizontal = zeros(size(imgAleatoria), 'uint8');
imgVertical = zeros(size(imgAleatoria), 'uint8');

[linhas, colunas] = size(imgAleatoria);
for i = 1:linhas
    for j = 1:colunas
        imgHorizontal(i, j) = imgAleatoria(i, colunas - j + 1);
        imgVertical(i, j) = imgAleatoria(linhas - i + 1, j);
    end
end

% Soma 100 aos pixels
img100 = uint8(min(double(imgAleatoria) + 100, 255));

figure;
subplot(1,4,1);
imshow(imgAleatoria);
title('Original');

subplot(1,4,2);
imshow(imgHorizontal);
title('Espelhada Horizontal');

subplot(1,4,3);
imshow(imgVertical);
title('Espelhada Vertical');

subplot(1,4,4);
imshow(img100);
title('+100 Intensidade');
