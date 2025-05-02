clear; clc;

% Converte imagem para cinza ---
img = imread('../../imagens/ny.jpg');
if size(img,3)==3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
img_gray = double(img_gray);   

[h, w] = size(img_gray);

% Filtro
sobel = [-1 0 1;
         -2 0 2;
         -1 0 1];

%  Padding 
pad = floor(size(sobel)/2);
img_pad = padarray(img_gray, pad, 'replicate');

% Convolução
res = zeros(h, w);
for i = 1:h
    for j = 1:w
        janela = img_pad(i:i+2, j:j+2);         
        res(i,j) = sum(janela .* sobel, 'all'); 
    end
end

% Magnitude, normalização e conversão para uint8
res = abs(res);
res = uint8( 255 * (res - min(res(:))) / (max(res(:)) - min(res(:))) );

figure;
subplot(1,2,1);
imshow(uint8(img_gray));
title('Original');
subplot(1,2,2);
imshow(sobel, []);
title('Filtro');

figure;
subplot(1,2,1);
imshow(uint8(img_gray));
title('Original');
subplot(1,2,2);
imshow(res);
title('Resultado');
