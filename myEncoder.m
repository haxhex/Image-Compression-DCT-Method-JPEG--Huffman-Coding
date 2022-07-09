% This function encode input image 
% 1. Convert image to 8x8 blocks
% 2. Quantization by standard matrix
% 3. Zigzag traverse matrix
% 4. Make Dictionary for Huffman coding
% 5. Apply Huffman coding
% output : encoded value and tables of Huffman Dictionary
function [encoder,tables] = myEncoder(input,N)

Q = [16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99];

[Hight, Width] = size(input);
l=(Hight/8)*(Width/8);
tables = cell(1,l);
n=1;
inToEncoder=1;

for i=1:8:Hight,
    for j=1:8:Width,
        block = input(i:i+7,j:j+7);
        imgToDouble = double(block)-128;
        block8DCT = DCT2(imgToDouble);
        block8quantization = round(block8DCT./(N*Q));
        zigBlock = zig(block8quantization);
        zigBlock128 = uint8(zigBlock + 128);
        huffDict = myHuffDictionary(zigBlock128);
        huffEncode = myHuffEncoder(zigBlock128,huffDict);
        huffDict{1,257} = length(huffEncode);
        tables{1,n} = huffDict;
        n = n + 1;
        
        for k=inToEncoder:inToEncoder+length(huffEncode)-1,
            encoder(k) = huffEncode(k-inToEncoder+1);
        end
        
        inToEncoder = inToEncoder + length(huffEncode);
    end
end

tables{n}=Hight;
tables{n+1}=Width;

end