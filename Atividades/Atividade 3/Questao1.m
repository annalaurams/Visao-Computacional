clear; clc;
addpath('/MATLAB Drive/Visão Computacional - 1');

% Questão 1 – Criar imagem aleatória 6×6 em escala de cinza
img = uint8(randi([0, 255], 6, 6));
figure;
imshow(img, []);
title('Imagem original 6×6 em escala de cinza');
disp('Imagem original (6×6):');
disp(img);

[h, w] = size(img);

% 1.a – Filtro 2×2 sem padding 

f2 = [1 180; 240 60];
[fH2, fW2] = size(f2);
outH2 = h - fH2 + 1;   % 6 - 2 + 1 = 5
outW2 = w - fW2 + 1;   % 5

res_a = zeros(outH2, outW2);
for i = 1:outH2
    for j = 1:outW2
        patch = double(img(i:i+fH2-1, j:j+fW2-1));
        res_a(i,j) = sum(patch .* double(f2), 'all');
    end
end

% Normaliza para [0,255]
res_a = uint8( 255 * (res_a - min(res_a,[],'all')) / (max(res_a,[],'all')-min(res_a,[],'all')) );

figure;
subplot(1,3,1); imshow(img, []);    title('Original 6×6');
subplot(1,3,2); imshow(f2, []);     title('Filtro 2×2');
subplot(1,3,3); imshow(res_a, []);  title('Resultado sem padding ');
disp('Resultado sem padding ');
disp(res_a);

% 1.b – Filtro 2×2 com padding

pad_b = floor([fH2 fW2]/2);  % [1 1]
img_pad_b = padarray(img, pad_b, 'replicate');

res_b = zeros(h, w);
for i = 1:h
    for j = 1:w
        patch = double(img_pad_b(i:i+fH2-1, j:j+fW2-1));
        res_b(i,j) = sum(patch .* double(f2), 'all');
    end
end

res_b = uint8( 255 * (res_b - min(res_b,[],'all')) / (max(res_b,[],'all')-min(res_b,[],'all')) );

figure;
subplot(1,3,1); imshow(img, []);    title('Original 6×6');
subplot(1,3,2); imshow(f2, []);     title('Filtro 2×2');
subplot(1,3,3); imshow(res_b, []);  title('Resultado com padding ');
disp('Resultad com padding ');
disp(res_b);

% 1.c – Filtro 3×3 sem padding 

f3 = [1 1 1; 1 2 1; 1 1 1];
[fH3, fW3] = size(f3);
outH3 = h - fH3 + 1;   % 6 - 3 + 1 = 4
outW3 = w - fW3 + 1;   % 4

res_c = zeros(outH3, outW3);
for i = 1:outH3
    for j = 1:outW3
        patch = double(img(i:i+fH3-1, j:j+fW3-1));
        res_c(i,j) = sum(patch .* double(f3), 'all');
    end
end

res_c = uint8( 255 * (res_c - min(res_c,[],'all')) / (max(res_c,[],'all')-min(res_c,[],'all')) );

figure;
subplot(1,3,1); imshow(img, []);    title('Original 6×6');
subplot(1,3,2); imshow(f3, []);     title('Filtro 3×3');
subplot(1,3,3); imshow(res_c, []);  title('Resultado sem padding ');
disp('Resultado sem padding ');
disp(res_c);

% 1.d – Filtro 3×3 com padding 

pad_d = floor([fH3 fW3]/2);  % [1 1]
img_pad_d = padarray(img, pad_d, 'replicate');

res_d = zeros(h, w);
for i = 1:h
    for j = 1:w
        patch = double(img_pad_d(i:i+fH3-1, j:j+fW3-1));
        res_d(i,j) = sum(patch .* double(f3), 'all');
    end
end

res_d = uint8( 255 * (res_d - min(res_d,[],'all')) / (max(res_d,[],'all')-min(res_d,[],'all')) );

figure;
subplot(1,3,1); imshow(img, []);    title('Original 6×6');
subplot(1,3,2); imshow(f3, []);     title('Filtro 3×3');
subplot(1,3,3); imshow(res_d, []);  title('Resultado com padding ');
disp('Resultado com padding');
disp(res_d);
