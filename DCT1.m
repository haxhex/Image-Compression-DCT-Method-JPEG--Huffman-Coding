% This function compute 1D DCT by using DCT-1 formula
function output = DCT1(input)

N = size(input,2);
output = zeros(1,N);

for k=1:N
    sigma = 0;
    
    for n=1:N
        sigma = sigma + input(n) * cos((pi/(2*N))*(2*n-1)*(k-1));
    end
    
    if k==1
        sigma = sigma * (1/sqrt(N));
        
    else
        sigma = sigma * sqrt(2/N);
    end
    
    output(1,k) = sigma;
end
