% This finction encode DCT coefficients by Created Dictionary
function output = myHuffEncoder(input, table)

    [hight, width] = size(input);
    encode = '';
    index = 1;
    
    for i=1 : hight
        for j=1 : width
            if input(i,j) == 255
                encode = strcat(encode,char(table(256)));
            else
                encode = strcat(encode,char(table(input(i,j)+1)));
            end
            
            while length(encode) > 8
                output(index) = uint8(bin2dec(encode(1:8)));
                encode(1:8) = [];
                index = index + 1;
            end
        end
    end
    
    if ~isempty(encode)
        output(index) = uint8(bin2dec(encode(1:length(encode))));
        output(index+1) = uint8(length(encode));
    end
    
end
