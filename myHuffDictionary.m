% Make tables similar to dictionary for having more efficient Huffman coding
function output = myHuffDictionary(input)

intensity = imhist(input);
index = 1;

for i=1 : 256,
    if intensity(i) ~= 0
        N(index) = myNode(intensity(i),i-1);
        index = index + 1;
    end
end

if length(N) == 1,
    setCode('0',N(1));
    root = N(1);
    table = cell(1,256);
    table = setTable(root, table);
    output = table;

else
N = sort(N);

while length(N) ~= 1,

    a = N(1);
    b = N(2);
    c = myNode(a.Intensity+b.Intensity, -1);
    
    if a.Intensity > b.Intensity,
        insertLeft(a,c);
        insertRight(b,c);
        
    else
        insertLeft(b,c);
        insertRight(a,c);
    end
    N(1) = [];
    N(1) = [];
    N(length(N)+1) = c;
    N = lastSort(N);
end

root = N(1);
table = cell(1,256);
table = setTable(root, table);
output = table;

end
end

function out = setTable(root, table)

    if root.Data >= 0
        table(root.Data+1) = {root.Code};
    end
    
    if ~isempty(root.Left)
        root.Left.Code = strcat(root.Code,'0');
        table = setTable(root.Left, table);
    end
    
    if ~isempty(root.Right)
        root.Right.Code = strcat(root.Code,'1');
        table = setTable(root.Right, table);
    end
    out = table;
end

function out = lastSort(nodes)

    l = length(nodes);
    i = l;
    
    while i ~= 1,
        if nodes(i-1).Intensity < nodes(l).Intensity
            break;
        end
        i = i-1;
    end
    
    tmp = nodes(l);
    nodes(i+1:l) = nodes(i:l-1);
    nodes(i) = tmp;
    out = nodes;
    
end

function out = sort(nodes)

    l = length(nodes);
    
    for i=1 : l-1,
        min = i;
        for j=i+1 : l,
            if nodes(min).Intensity > nodes(j).Intensity
                min = j;
            end
        end
        
        temp = nodes(i);
        nodes(i) = nodes(min);
        nodes(min) = temp;
    end
    out = nodes;
    
end
