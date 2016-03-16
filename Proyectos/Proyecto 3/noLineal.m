%Hector Mauricio Gonzalez Coello
%2016
function [x,Error,i] = noLineal (x0,eps,maxit,metodo)
	if metodo == 0
		[x, Error, i]=NnR(x0, eps, maxit);
	else if metodo ==1
		[x, Error, i]=sc(x0, eps, maxit);
	end
end
function [x, Error, i] = NnR(x0, eps, maxit)
	Error=1;
	for i=1:maxit
		x=x0-f(x0)/df(x0);
		if (abs(x-x0)<=eps)
			Error=0;
			break;
		else
			x0=x;
	end
	if (Error==1)
		x='El metodo no converge';
		i=maxit;
	end
end
function [x, Error, i] = sc(x0, eps, maxit)
	Error=1;
	for i=1:maxit
		x=x0(1)-(((x0(1)-x0(2))*f(x0(1)))/((f(x0(1)))-f(x0(2))));
		x0(2)=x0(1);
		x0(1)=x;
		if (abs(x0(1)-x0(2))<eps)
			Error=0;
			break
	end
	if (Error==1)
		x='El metodo no converge';
		i=maxit;
	end
end