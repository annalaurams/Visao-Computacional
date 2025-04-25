clc, clear;
b = [255 150 0; 10 80 220; 244 100 0];
[lin,col]=size(b)
disp(b)

figure(3);imshow(b);
figure(3);imshow(uint8(b))

r = uint8(randi([0, 255], 10, 10));
g = 255*ones(10, 10, 'uint8');
b = uint8(randi([0, 255], 10, 10));
c = cat(3, r, g, b);

[lin,col]=size(c)
figure(4);imshow(c)
