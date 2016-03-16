%Hector Mauricio Gonzalez Coello
%2016
function [VO,R]=ortogonaliza(V, eps)
  [m,n]=size(V)
    VO = zeros(m,n); #Initialazing final 
    a = zeros(n);  #Initialazing alpha
    i = 1; j = 1; k =2; #counters
    VO(:,1)= V(:,1)  #e1 = x1
    
    while (k<=n)  #filling vector x1, x2,...,xn
      x(:,k)= V(:,k)
      k++;
    end
     while (i<=n-1)  #making e2=x2, e3=x3,...,en=xn
       VO(:,i+1) = x(:,i+1)
       while (j<=i) #Gram-Schmidt equations
        a(j,i+1) = (dot(x(:,i+1) , VO(:,j))) / (dot(VO(:,j) , VO(:,j))); #Obtaining alpha
        VO(:,i+1) = VO(:,i+1) - a(j,i+1) * VO(:,j);  #Obtaining final ortogonalized vectors
        j++;
       end
     i++;
   end
  R = n;  #range
end