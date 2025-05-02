clear; clc;

% Questão 1 - Criar imagem RGB aleatória 6x6

imgRGB = uint8(randi([0, 255], 6, 6, 3));

figure;
imshow(imgRGB);
title('Imagem RGB Aleatória');

% Separar os canais
canalR = imgRGB(:,:,1);
canalG = imgRGB(:,:,2);
canalB = imgRGB(:,:,3);

% 1.a - Filtro 2×2 sem padding
filtro2x2 = [1 2; 2 1];

convRc = conv2(double(canalR), double(filtro2x2), 'valid');
convGc = conv2(double(canalG), double(filtro2x2), 'valid');
convBc = conv2(double(canalB), double(filtro2x2), 'valid');

convRc = uint8(convRc / max(convRc(:)) * 255);
convGc = uint8(convGc / max(convGc(:)) * 255);
convBc = uint8(convBc / max(convBc(:)) * 255);

imgFiltrada_c = cat(3, convRc, convGc, convBc);

figure;
imshow(imgFiltrada_c);
title('RGB 2×2 (sem padding)');

figure;
subplot(1,3,1), imshow(convRc, []), title(' Canal R');
subplot(1,3,2), imshow(convGc, []), title(' Canal G');
subplot(1,3,3), imshow(convBc, []), title(' Canal B');


% 1.b - Filtro 2×2 com padding = 2
pad_d = 2;
Rpad_d = padarray(canalR, [pad_d pad_d], 'replicate');
Gpad_d = padarray(canalG, [pad_d pad_d], 'replicate');
Bpad_d = padarray(canalB, [pad_d pad_d], 'replicate');

convRd = conv2(double(Rpad_d), double(filtro2x2), 'valid');
convGd = conv2(double(Gpad_d), double(filtro2x2), 'valid');
convBd = conv2(double(Bpad_d), double(filtro2x2), 'valid');

convRd = uint8(convRd / max(convRd(:)) * 255);
convGd = uint8(convGd / max(convGd(:)) * 255);
convBd = uint8(convBd / max(convBd(:)) * 255);

imgFiltrada_d = cat(3, convRd, convGd, convBd);

figure;
imshow(imgFiltrada_d);
title('RGB 2×2 (padding 2)');

figure;
subplot(1,3,1), imshow(convRd, []), title(' Canal R');
subplot(1,3,2), imshow(convGd, []), title(' Canal G');
subplot(1,3,3), imshow(convBd, []), title(' Canal B');

% 1.c - Filtro 3×3 sem padding

filtro3x3 = [1 1 1; 1 2 1; 1 1 1];

convRa = conv2(double(canalR), double(filtro3x3), 'valid');
convGa = conv2(double(canalG), double(filtro3x3), 'valid');
convBa = conv2(double(canalB), double(filtro3x3), 'valid');

% Normalização
convRa = uint8(convRa / max(convRa(:)) * 255);
convGa = uint8(convGa / max(convGa(:)) * 255);
convBa = uint8(convBa / max(convBa(:)) * 255);

% Imagem RGB filtrada
imgFiltrada_a = cat(3, convRa, convGa, convBa);

figure;
imshow(imgFiltrada_a);
title('RGB 3×3 (sem padding)');

figure;
subplot(1,3,1), imshow(convRa, []), title(' Canal R');
subplot(1,3,2), imshow(convGa, []), title(' Canal G');
subplot(1,3,3), imshow(convBa, []), title(' Canal B');


% 1.d - Mesmo filtro 3×3 com padding = 2
pad_b = 2;
Rpad_b = padarray(canalR, [pad_b pad_b], 'replicate');
Gpad_b = padarray(canalG, [pad_b pad_b], 'replicate');
Bpad_b = padarray(canalB, [pad_b pad_b], 'replicate');

convRb = conv2(double(Rpad_b), double(filtro3x3), 'valid');
convGb = conv2(double(Gpad_b), double(filtro3x3), 'valid');
convBb = conv2(double(Bpad_b), double(filtro3x3), 'valid');

convRb = uint8(convRb / max(convRb(:)) * 255);
convGb = uint8(convGb / max(convGb(:)) * 255);
convBb = uint8(convBb / max(convBb(:)) * 255);

imgFiltrada_b = cat(3, convRb, convGb, convBb);

figure;
imshow(imgFiltrada_b);
title(' RGB 3×3 (padding 2)');

figure;
subplot(1,3,1), imshow(convRb, []), title(' Canal R');
subplot(1,3,2), imshow(convGb, []), title(' Canal G');
subplot(1,3,3), imshow(convBb, []), title(' Canal B');


