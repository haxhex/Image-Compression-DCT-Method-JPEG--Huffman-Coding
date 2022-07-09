% This function traverse a matrix in zigzag way
function output = invZig(input)

img = zeros(8,8);
in=0;
l=size(img);
sum=l(2)*l(1);
for k=2:sum
 c=rem(k,2);
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==k)
                in=in+1;
                if(c==0)
                    img(j,k-j) = input(in);
                else          
                    img(k-j,j) = input(in);
                end
             end    
         end
     end
end
output = img;
end