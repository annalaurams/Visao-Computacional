% COLORIDO

clear; clc;

% Imagem RGB aleatória 
imgRGB = uint8(randi([0, 255], 3, 3, 3));

[linhas, colunas, canais] = size(imgRGB);

imgEspelhadaH = zeros(size(imgRGB), 'uint8');
imgEspelhadaV = zeros(size(imgRGB), 'uint8');
for k = 1:canais
    for i = 1:linhas
        for j = 1:colunas
            imgEspelhadaH(i, j, k) = imgRGB(i, colunas - j + 1, k);
            imgEspelhadaV(i, j, k) = imgRGB(linhas - i + 1, j, k);
        end
    end
end

% intensidade da cor por um fator 2
img2 = uint8(min(double(imgRGB) * 2, 255));

figure;
subplot(1,4,1);
imshow(imgRGB);
title('Original RGB');

subplot(1,4,2);
imshow(imgEspelhadaH);
title('Espelhada Horizontal');

subplot(1,4,3);
imshow(imgEspelhadaV);
title('Espelhada Vertical');

subplot(1,4,4);
imshow(img2);
title('Intensidade x2');

figure;
imshow(imgRGB);
title('Imagem Original Sozinha');
