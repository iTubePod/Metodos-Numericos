Gauss: Se elimina lo que queda de la columna
Gauss piv: Se cambia antes por elem con val abs más grande que esté abajo
Gauss-j: Gauss piv pero se modifica toda la columna, no sólo abajo
Jacobi
	1. Despejar x1 de r1, x2 de r2, etc
	2. Poner un vector inicial (de ceros)
	3. Cada valor sustituir en cada función del paso 1
Gauss-Seidel	
	1. Despejar x1 de r1, x2 de r2, etc
	2. Poner un vector inicial (de ceros)
	3. Se usan los valores ya obtenidos al sustituir
___________________
Punto fijo
	1.	Pasar función  y = x a x = y (O sea despejar una x) Esto lo llamamos g(x)
	2. 	Se elige una x inicial
	3.	Se sustituye en g(x).
	4. 	El resultado es la nueva x
	5. 	Se repite hasta que xi-1 - x < eps
Newton-Raphsoon
	1. Se tiene la función y su derivada
	2. Se elige una x inicial
	3. x - f(x)/df(x)
	4. e = xi - xi-1
Secante
	1. Se tienen 2 x iniciales
	2. Se calcula el valor de la funcion en cada uno
	3. Se usa la siguiente formula
	x(i+1) = xi -  (xi - x(i-1))f(xi)  / (f(xi)-f(x(i-1)))
	4. Se suben las xs
Posicion Falsa
	1. Se tiene una xi y xd
	2. Se calcula con la siguiente formula
	xmid = (xi*fd - xd*fi)/(fd-fi)
	3. Evaluar xmid en la función (fm)
	4. Si FD*FM > 0, cambiar FD, sino FI
Biseccion
	1. Se tiene una xi y xd
	2. Se obtiene xmid
	3. Se evalua xmid en la funcion
	4. Si el resultado es menor a 0, se cambia xi. Sino, se cambia xd