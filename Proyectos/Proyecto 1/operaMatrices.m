%Hector Mauricio Gonzalez Coello
%2016
function [R,E,M]=operaMatrices(A,B,N)
	if N==0
		R=sumaM(A,B);
	elseif N==1
		R=restaM(A,B);
	elseif N==2
		R=multM(A,B);
	elseif N==3
		R=desM(A);
	elseif N==4
		R=MaxMin(A);
	else
		R='Opcion no existe';
	end
end

function su=sumaM(A,B) %Calcula la suma de dos matrices
	[fila,colua]=size(A); %Regresa el numero de filas y columnas de la respectiva matriz y la guarda en las variables fila y colua
	[filb, colub]= size(B);
	if fila<filb||fila>filb||colua>colub||colua<colub %revisa que las matrices dadas sean de mismo tamaño
		cond=false;
		su='Dimensiones no compatibles para suma';
	else
		for i=1:fila
			for j=1:colua
				su(i,j)=A(i,j)+B(i,j); %recorre las dos matrices para realizar la suma
			end
		end
	end
end

function res=restaM(A,B) %Calcula la resta de dos matrices
	[fila,colua]=size(A); %Regresa el numero de filas y columnas de la respectiva matriz y la guarda en las variables fila y colua
	[filb, colub]= size(B);
	if fila<filb||fila>filb||colua>colub||colua<colub %revisa que las matrices dadas sean de mismo tamaño
		res='Dimensiones no compatibles para resta';
	else
		for i=1:fila
			for j=1:colua
				res(i,j)=A(i,j)-B(i,j); %recorre las dos matrices para realizar la resta
			end
		end
	end
end

function mul=multM(A,B) %Calcula la multiplicación de dos matrices
	temp=0;
	[fila,colua]=size(A); %Regresa el numero de filas y columnas de la respectiva matriz y la guarda en las variables fila y colua
	[filb, colub]= size(B);
	cont=fila*colub;
	mul=zeros(fila, colua);
	if (colua~=colub||colua~=filb) %revisa que las matrices dadas sean aptas para multiplicación
		mul='Dimensiones no compatibles para multiplicacion';
	else
		for i=1:fila
			for j=1:colua
				for k=1:filb
					mul(i,j)+=A(i,k)*B(k,j); %recorre las dos matrices para realizar la multiplicacion en base a las reglas de esta operación
				end
			end
		end
	end
end

function meva=desM(A) 
	[fila,colua]=size(A);
	varianza=0;
	for i=1:fila
		med=0;
		for j=1:colua
			med=med+A(i,j); %hace la sumatoria de todos los valores de la fila
		end
		med=med/colua; %divide la sumatoria previemente ejecutada entre el cumero de columnas que tiene la matriz
		meva(i,1)=med; %guarda la media en la primera columna de la matriz resultante
		temp=0;
		for j=1:colua
			temp=temp+((A(i,j)-med)^2); %la misma media calculada previemente se reutiliza para calcular cada elemento del numerador de la fórmula de la varianza
		end
		varianza=sqrt(temp/colua); %divide la sumatoria previamente ejecutada entre el número de columnas 
		meva(i,2)=varianza; %guarda el valor de la varianza en la segunda columna de la matriz resultante
	end
end

function mami=MaxMin(A) %Calcula el máximo y mínimo de una matriz
	[fila,colua]=size(A);
	for i=1:colua
		ma=A(1,i);
		for j=1:fila
			if A(j,i)>ma %compara elemento por elemento en busca del máximo
				ma=A(j,i);
			end
		end
		mami(i,1)=ma; %Guarda el maximo de la columna en la primera columna de la matriz resultante
	end
	for i=1:colua
		mi=A(1,i);
		for j=1:fila
			if A(j,i)<mi %compara elemento por elemento en busca del mínimo
				mi=A(j,i);
			end
		end
		mami(i,2)=mi; %Guarda el mínimo de la columna en la primera columna de la matriz resultante
	end
end