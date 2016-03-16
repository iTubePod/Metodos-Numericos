function [y z] = CuadradoCubo(x)
	y=x ** 2;
	z=cubo(x);
end
function z=cubo(x1)
	z=x1^ 3;
end