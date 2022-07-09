% This function compute inverse of DCT-1D
function output = invDCT1(input)

N = size(input,2);
output = zeros(1,N);

for k=1:N
    sigma = 0;
    for n=1:N
        if n==1
            sigma = sigma + (1/sqrt(N)) * input(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        else
            sigma = sigma + sqrt(2/N) * input(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        end
    end
    output(1,k) = sigma;
end
