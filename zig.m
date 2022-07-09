function output = zig(input)

index=0;
l=size(input);
sum=l(2)*l(1);

for n=2:sum
 c=rem(n,2);
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==n)
                index=index+1;
                if(c==0)
                output(index)=input(j,n-j);
                else          
                output(index)=input(n-j,j);
                end
             end    
         end
     end
end

end