clear; clc;

% Imagem RGB e separar os canais 
imgRGB = imread('./../imagens/ny.jpg');
if size(imgRGB,3)~=3
    error('Usar uma imagem RGB de 3 canais.');
end
R = double(imgRGB(:,:,1));
G = double(imgRGB(:,:,2));
B = double(imgRGB(:,:,3));

[h, w] = size(R);

% Filtro
sobel = [ -1  0  1;
          -2  0  2;
          -1  0  1 ];

% Padding 
pad = floor(size(sobel)/2);
R_pad = padarray(R, pad, 'replicate');
G_pad = padarray(G, pad, 'replicate');
B_pad = padarray(B, pad, 'replicate');

% Convolução 
resR = zeros(h, w);
resG = zeros(h, w);
resB = zeros(h, w);
for i = 1:h
    for j = 1:w
        wR = R_pad(i:i+2, j:j+2);
        wG = G_pad(i:i+2, j:j+2);
        wB = B_pad(i:i+2, j:j+2);
        resR(i,j) = sum(wR .* sobel, 'all');
        resG(i,j) = sum(wG .* sobel, 'all');
        resB(i,j) = sum(wB .* sobel, 'all');
    end
end

%  Magnitude e normalização 
resR = abs(resR);
resG = abs(resG);
resB = abs(resB);

resR = uint8( 255 * (resR - min(resR(:))) / (max(resR(:)) - min(resR(:))) );
resG = uint8( 255 * (resG - min(resG(:))) / (max(resG(:)) - min(resG(:))) );
resB = uint8( 255 * (resB - min(resB(:))) / (max(resB(:)) - min(resB(:))) );

imgSobelRGB = cat(3, resR, resG, resB);

figure;
% Canal R
subplot(3,3,1);
imshow(uint8(R), []);      title('Original — R');
subplot(3,3,2);
imshow(sobel, []);         title('Filtro ');
subplot(3,3,3);
imshow(resR);              title('Resultado — R');

% Canal G
subplot(3,3,4);
imshow(uint8(G), []);      title('Original — G');
subplot(3,3,5);
imshow(sobel, []);         title('Filtro ');
subplot(3,3,6);
imshow(resG);              title('Resultado — G');

% Canal B
subplot(3,3,7);
imshow(uint8(B), []);      title('Original — B');
subplot(3,3,8);
imshow(sobel, []);         title('Filtro ');
subplot(3,3,9);
imshow(resB);              title('Resultado — B');

figure;
imshow(imgSobelRGB);
title('Imagem RGB resultante');
