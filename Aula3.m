clc, clear
a = imread('../imagens/img.jpeg')
figure(1);imshow(a)
figure(2);imshow(uint8(a))

R = a(:,:,1);
G = a(:,:,2);
B = a(:,:,3);

figure(3);imshow(R)
figure(4);imshow(G)
figure(5);imshow(B)

R_vermelha = cat(3, R, zeros(size(R), 'uint8'), zeros(size(R), 'uint8'));
G_verde    = cat(3, zeros(size(G), 'uint8'), G, zeros(size(G), 'uint8'));
B_azul     = cat(3, zeros(size(B), 'uint8'), zeros(size(B), 'uint8'), B);

figure(6); imshow(R_vermelha); title('canal R');
figure(7); imshow(G_verde);    title('canal G');
figure(8); imshow(B_azul);     title('Imagem com apenas o canal B');
