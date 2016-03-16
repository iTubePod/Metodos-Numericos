%Hector Mauricio Gonzalez Coello
%2016
function [R, E] = convierteReal(n, m, e, b)
	if b==0
		[R, E]=totmp(n, m, e);
	else
		[R, E]=todec(n, m, e);
	end
end
function [R, E] = totmp(n, m, e)
	if n>=0
		Sig(1)=0; %Guarda el valor de los signos de n
	else
		Sig(1)=1;
		n=n*(-1);
	end
	n=num2str(n);
	num=strfind(n,'.'); %Usada para dividir n en parte entera y parte decimal
	for i=1:num-1
		in(i)=n(i);
	end
	n=str2num(n);
	in=str2num(in);
	dec=n-in;
	if in==0
		Sig(2)=1;
	else
		Sig(2)=0;
	end

	allbin=[];
	decb=[];
	exb=[];

	i=1;
	while (in >= 1) %ciclo de conversion decimal a binario
      	tmp = mod(in, 2); %saca mod de la parte entera para conversion a binario
      	tmp = fix(tmp);
      	in = in /2;
      	allbin(i)=tmp; %guarda el numero completo con decimal en binario
      	entb(i)=tmp; %guarda solamente la conversion de la parte entera
      	i++;
    end
    allbin = flip(allbin); %invierte los 0 y 1 como a mano
    k=2;
    while ( dec < 1 ) %ciclo de conversion de fraccion a binario
      	for j = i:m
        	dec = dec * 2;
        	if dec>=1
        		allbin(j)=1; 
        		decb(k)=1;   %guarda la parte decimal en binario
        	else
        	tmp = fix(dec);
        	allbin(j)=tmp;
        	decb(k)=tmp; 
        	end
      	end 
    	k++;
    end
	k=i-1;
	while k>=1 %crea el binario del exponente
		for l = 1:e 
        	tmp = mod(k, 2);
        	tmp = fix(tmp);
        	k = k /2;
        	exb(l)=tmp;
      	end 
	end
	exb=fliplr(exb);
	entb=fliplr(entb);
	R=[Sig, exb, allbin];
	E=mat2str(entb);
	E=strrep(E,' ','');
	E=str2num(E);
	E=num2str(E);
	tmp=0;
	for i=1:size(decb)+1 %convierte la parte fraccionaria a entero nuevamente para calcular el error
		if decb(i)==1
			tmp=tmp+(1/2^i);
		end
	end
	E=(bin2dec(E)+tmp)-n;
end
function [R, E] = todec(n, m, e)
	if n(1)=='0' %detecta que tendria la conversion
		neg=false;
	else
		neg=true;
	end
	k=1;
	for i=3:e+2 %guarda el binario del exponente
		ex(k)=n(i);
		k++;
	end
	k=1;
	for i=3+e:length(n) %guarda la mantisa completa
		num(k)=n(i);
		k++;
	end
	ex=bin2dec(ex);
	k=1;
	for i=3+e:ex+2+e %guarda la mantisa de enteros
		ent(k)=n(i);
		k++;
	end
	k=1;
	for i=ex+3+e:length(n) %guarda la mantisa de decimales
		dec(k)=n(i);
		k++;
	end
	tmp=0;
	for i=1:length(dec) % convierte la parte decimal
		if dec(i)=='1'
			tmp=tmp+(1/2^i);
		end
	end
	if (neg) % regresa el valor completo de la matisa en decimal en pos o neg
		R=-1*(bin2dec(ent)+tmp);  
	else
		R=(bin2dec(ent)+tmp);
	end
	E="No importa";
end