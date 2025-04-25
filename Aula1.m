clc, clear
a = round(255*rand(50))
[lin, col]=size(a)
disp(a)
figure(1);imshow(a)
figure(2);imshow(uint8(a))

b = [255 250 0; 10 80 220; 244 100 0];
[lin, col]=size(b)
disp(b)
figure(3);imshow(b)
figure(3);imshow(uint8(b))

r = uint8(randi([0, 255], 10, 10));
g = uint8(randi([0, 255], 10, 10));
b = 120*ones(10,10, 'uint8');

c = cat(3, r, g, b);
[lin, col] =size(c)
figure(4);imshow(c)