function [L,E]=potenciaLista(lista1,lista2)
	if(length(lista1)==length(lista2))
		for i=1:length(lista1)
			L(i)=lista1(i)^lista2(i);
		end
		E=0;

	else
		L=0;
		E=1;
	end
end