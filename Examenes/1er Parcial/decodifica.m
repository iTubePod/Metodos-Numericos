function M = decodifica(matriz, lista)
	[a,b]=size(matriz);
  for i=1:b
    for j=1:a
      for k=1:length(lista)
        if (matriz(j,i)==lista(k))
          M(j,i)=k-1;
        end
      end
    end
  end
end