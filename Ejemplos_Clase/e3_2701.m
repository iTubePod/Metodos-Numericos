function cuadradoMatriz(M)
	[a b]= size(M);
	for i=1:a
		for j=1:b
			Mres(i,j)=M(i, j)**2;
		end
	end
end