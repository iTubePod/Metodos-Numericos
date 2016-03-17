%Hector Mauricio Gonzalez Coello
%A01328258
%2016
function [VO,R] = ortogonaliza(V, eps)
	[x,y] = size (V);
	VO = zeros (x, y);
	a = zeros (x);
	VO(:, 1) = V(:, 1);
	for i=1:x-1
		VO(:, i+1) = V(:, i+1);
	    for j=1:i
	    	a(j, i+1) = (dot(V(:, i+1) , VO(:, j))) / (dot(VO(:, j) , VO(:, j))); 
			VO(:, i+1) = VO(:, i+1) - a(j, i+1) * VO(:, j);
	    end
	end
	i = 1;
	for j=1:x
	    if  norm(VO(:, j)) < eps  
	    	x = x-1;
		else 
	    	tmp(:, j) = VO(:, i);  
	    	i ++;
	    end
	end
	VO = tmp;
	R = x;  
end