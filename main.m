function main

input = imread('input_img.jpg');
N=1; % incresing N will give you more compressed image
% Encode image and store encoding value by Huffman and Dictionary to encode
% and tables
[encode,tables] = myEncoder(input,N);
% we can re-bulid image by decoding Huffman encode and created dictionary
output = myDecoder(encode,tables,N);
% showing input image at the left side
figure,subplot(1,2,1),imshow(input);
title('Input')
% showing output image at the right side
subplot(1,2,2),imshow(output);
title('Output')

end