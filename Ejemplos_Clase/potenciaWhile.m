function res=potenciaWhile(a, b)
	%regresa en res la potencia de a elevada a la b
	i = 1;
	res=1;
	while i <= b
		res=res*a;
		i++;
	end
end