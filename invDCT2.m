% This function compute inverse of DCT-2D by 2 DCT-1D

function output = invDCT2(input)

N = size(input,1);
M = size(input,2);
output = zeros(N,M);

for y=1:N
    output(y,:) = invDCT1(input(y,:));
end

for x=1:M
    output(:,x) = invDCT1(output(:,x)')';
end
