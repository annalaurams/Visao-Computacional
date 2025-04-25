
clc, clear
a = imread('../imagens/img.jpeg');
figure(1), imshow(a), title('Imagem Original');

a_flip_x = flip(a, 2);
figure(2), imshow(a_flip_x), title('Espelhamento Horizontal');

a_flip_y = flip(a, 1);
figure(3), imshow(a_flip_y), title('Espelhamento Vertical');

a_rot90 = imrotate(a, 90);
figure(4), imshow(a_rot90), title('Rotação 90°');

a_rot180 = imrotate(a, 180);
figure(5), imshow(a_rot180), title('Rotação 180°');

a_rot270 = imrotate(a, 270);
figure(6), imshow(a_rot270), title('Rotação 270°');

clc, clear

a = imread('../imagens/img.jpeg');

shx = 0.5;
tform_x = affine2d([1 shx 0; 0 1 0; 0 0 1]);
a_shear_x = imwarp(a, tform_x);
figure(7), imshow(a_shear_x), title('Cisalhamento Horizontal');

shy = 0.5;
tform_y = affine2d([1 0 0; shy 1 0; 0 0 1]);
a_shear_y = imwarp(a, tform_y);
figure(8), imshow(a_shear_y), title('Cisalhamento Vertical');
