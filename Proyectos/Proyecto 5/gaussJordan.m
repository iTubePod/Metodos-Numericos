

%Hector Mauricio Gonzalez Coello
%A01328258
%Abril, 2016


function [x, Ainv, d, Solucion] = gaussJordan(A,b,op)
	if(op==1)
		[x, Ainv, d, Solucion] = gaussJordanA(A, b)
	else if (op==2)
		[x, Ainv, d, Solucion] = gaussJordanB(A, b)
	else
		disp('Invalid option')

end;
function [x, Ainv, d, Solucion] = gaussJordanA (A, b)
	[n, y]= size(A);
	if(n != y)
		d = 0;
		Solucion = 0;
		Ainv = 0;
		x = 0;
	end
	A=[A, b'];
	[n, y] = size(A);
	for i=1:y-1 
	  	if (A(i,i) != 0)
		   	A(i,:)=A(i,:)/A(i,i);
		   	for j=i+1:n
			    A(j,:)=A(j,:)-A(i,:)*A(j,i); 
			    j=j+1; 
			    A;
	   		end 
	  	i=i+1; 
	  	else
	   		x = 0;
	   		solucion = 0;
	   		Ainv= 0;
	   		d = 0;
	 	end
 	end
 	for i=n:-1:2 
	  	for j=i-1:-1:1 
		   	A(j,:)= A(j,:)-A(i,:)*A(j,i);
		   	j=j-1; 
		   	A;
	  	end 
  		i=i-1; 
 	end 
  	for i = 1:n
	  	A(i,:) = A(i, :)/A(i,i);
	   	x(i) = A(i,y);
  	end
  	x=x;
  	Solucion = 1;
  	Ainv= 0;
  	d = 0;

end

function [x, Ainv, d, Solucion]=gaussJordanB(A)
	[n, y]= size(A);
	det=1;
	Ainv= eye(n);
	A = [A, Ainv];
	if(n != y)
		d = 0;
		Solucion = 0;
		Ainv = 0;
		x = 0;
	end
	for i=1:n-1
		for j=2:n
			if(A(i,i)==0)
				tmp=A(1,:);
				A(1,:) = A(j,:);
				A(j,:) = tmp;
			end
		end
		for k=i+1:n
			A(k,:) = A(k,:)-A(i,:)*A(k,i)/A(i,i);
		end
	end
	for i=n:-1:2
		for j=i-1:-1:1
			A(j,:) = A(j,:)-A(i,:)*A(j,i)/A(i,i);
		end
	end
	for i=1:n
		det = A(i,i)*det;
	end
	for i=1:n
		A(i,:)=A(i,:)/A(i,i);
	end
	for i=1:y
		for j=1:y
			Ainv(i,j) = A(i,j+y);
		end
	end
	x=0;
	Solucion=2;
	Ainv;
	d=det;
end
end
end