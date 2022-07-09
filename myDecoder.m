% This fuction Decode coefficient to re-build image 
function output = myDecoder(encoder,tables,N)

Q = [16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99];

l=length(tables);
Width=tables{l};
Hight=tables{l-1};
output = zeros(Hight,Width);
a=1;
b=1;

for i=1:l-2,
    dict = tables{i};
    n = dict{257};
    e = encoder(1:n);
    encoder(1:n) = [];
    decode = myHuffDecoder(e,dict);
    decode = double(decode) - 128;
    invZigDecode = invZig(decode);
    dequantization = invZigDecode.*(N*Q);
    invDCT = invDCT2(dequantization);
    invRDCT128 = round(invDCT+128);
    output(a:a+7,b:b+7) = uint8(invRDCT128);
    b = b + 8;
    
    if b > Width
        b = 1;
        a = a + 8;
    end
    
end

output = uint8(output);
end