% This function compute DCT-2D 
function output = DCT2(input)

N = size(input,1);
M = size(input,2);
output = zeros(N,M);

for y=1:N
    output(y,:) = DCT1(input(y,:));
end

for x=1:M
    output(:,x) = DCT1(output(:,x)')';
end
