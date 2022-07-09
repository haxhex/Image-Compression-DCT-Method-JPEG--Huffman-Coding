% This fuction decode vlaue which coded by applying Huffman
function output = myHuffDecoder(input, table)

    decode = '';
    index = 1;
    l = length(table);
    root = myNode(-1,-1);
    
    for i=1 : l
        if ~isempty(table{i})
             root = huffTreeMaker(root, i-1, table{i});
        end
    end
    
    r = root;
    while length(input) > 2
        if isempty(decode)
            decode = strcat(decode,dec2bin(input(1),8));
            input(1)=[];
        end
        
        if decode(1) == '0'
            r = r.Left;
        elseif decode(1) == '1'
            r = r.Right;
        end
        decode(1) = [];
        
        if isLeaf(r)
            output(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
    
    if ~isempty(input)
        decode = strcat(decode,dec2bin(input(1),input(2)));
    end
    
    while ~isempty(decode)
        if isempty(decode)
            decode = strcat(decode,dec2bin(input(1),8));
            input(1)=[];
        end
        
        if decode(1) == '0'
            r = r.Left;
        elseif decode(1) == '1'
            r = r.Right;
        end
        decode(1) = [];
        
        if isLeaf(r)
            output(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
end

function out = huffTreeMaker(root, data, code)
    if isempty(code)
        root.Data = data;
    
    else
        if code(1) == '0'
            if isempty(root.Left)
                insertLeft(myNode(-1,-1), root);
            end
            huffTreeMaker(root.Left, data, code(2:length(code)));
            
        elseif code(1) == '1'
            if isempty(root.Right)
                insertRight(myNode(-1,-1), root);
            end
            huffTreeMaker(root.Right, data, code(2:length(code)));
        end
    end
    
    out = root;
end

function out = isLeaf(node)
    out = isempty(node.Left) & isempty(node.Right);
end