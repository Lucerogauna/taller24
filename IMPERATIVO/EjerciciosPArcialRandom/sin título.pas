{
 3. Implementar un programa modularizado para una librería. Implementar módulos para:
 a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
 código de producto. De cada producto deben quedar almacenados su código, la
 cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
 venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
 ingreso de las ventas finaliza cuando se lee el código de venta-1.
 b. Imprimir el contenido del árbol ordenado por código de producto.
 c. Retornar el código de producto con mayor cantidad de unidades vendidas.
 d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro
 * e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetros
  
	writeln(''); readln(); 
}
program libreria;
type
	producto = record
		codP: integer;
		cantTot: integer;
		montoTot: real;
	end;
	productoLeer = record
		codVenta: integer;
		codPro: integer;
		cantU: integer;
		precioU: real;
	end;
	arbol= ^nodo;
	nodo= record
		dato: producto;
		hi, hd: arbol;
	end;
procedure leer (var p: productoLeer);
begin
	writeln('leer cod Venta'); readln(p.codVenta);
	if p.codVenta <> 0 then begin
	writeln('leer cod producto'); readln(p.codPro);
	writeln('leer cant unidades vendidas');p.cantU:= random (5); //readln(p.cantU);
	writeln('leer precio unit'); p.precioU:=random(10);// readln(p.precioU); 
end;
end;
procedure agregarA (var a: arbol; p: productoLeer);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.codP:=p.codPro;
		a^.dato.cantTot:= p.cantU;
		a^.dato.montoTot:= (p.precioU * p.cantU);
		a^.hi:= nil; a^.hd:= nil;
	end
	else  begin
	 if (a^.dato.codP = p.codPro) then begin
			a^.dato.cantTot:=a^.dato.cantTot + p.cantU;
			a^.dato.montoTot:=a^.dato.montoTot + (p.cantU * p.precioU);
		end
		else if(a^.dato.codP > p.codPro) then
			agregarA (a^.hi, p)
		else 
			agregarA (a^.hd, p);
	end;
end;
procedure cargarA (var a: arbol);
var p: productoLeer;
begin
	leer(p);
	while (p.codVenta <> 0) do begin
		agregarA (a, p);
		leer(p);
	end;
end;
{ b. Imprimir el contenido del árbol ordenado por código de producto.}
procedure imprimirOrdenado (a: arbol);
begin
	if (a <> nil) then begin
		imprimirOrdenado (a^.hi);
		writeln ('el codigo de producto es ->', a^.dato.codP);
		writeln ('cant total :', a^.dato.cantTot);
		writeln ('monto total :', a^.dato.montoTot:2:0);
		imprimirOrdenado (a^.hd);
	end;
end;
{c. Retornar el código de producto con mayor cantidad de unidades vendidas.}
procedure incisoC (a:arbol; var codM: integer; var max: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.cantTot > max) then begin
			max:= a^.dato.cantTot;
			codM:= a^.dato.codP;
		end;
		incisoC (a^.hi, codM, max);
		incisoC (a^.hd, codM, max);
end;
end;
{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro}
 function codMenorA(a: arbol; n: integer): integer;
 var cant: integer;
 begin
	if (a= nil) then
		cant:= 0
	else begin 
		if (a^.dato.codP < n) then
			cant:= 1 + codMenorA(a^.hi, n) +  codMenorA(a^.hd, n)
		else //if (a^.dato.codP > n) then
			cant:= codMenorA(a^.hi, n);
		end;
	codMenorA:= cant;
 end;
 {
 * e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetros}
 function montoTot (a: arbol; x, y: integer): real;
 var c: real;
 begin
	if (a= nil) then 
		c:= 0
	else begin
		if ((a^.dato.codP > x ) and (a^.dato.codP< y)) then 
			c:= a^.dato.montoTot + montoTot(a^.hi, x, y) +montoTot(a^.hd, x, y)
		else if (a^.dato.codP <= x ) then
			c:= montoTot(a^.hi, x, y)
		else if(a^.dato.codP >= y ) then
			c:= montoTot(a^.hi, x, y)
	end;
	montoTot:= c;
 end;
VAR 
 a: arbol; cm,num, codA,x, y,  max: integer; montoEntre: real;
BEGIN
	a:= nil;
	cargarA (a);
	imprimirOrdenado (a);
	max:=-1;
	incisoC(a, cm, max);
	writeln ('cod de pproductos con mas cantidad de productos es:', cm);
	writeln('leer numero '); readln (num);
	codA:= codMenorA (a, num);
	writeln('l cantidad de codigo menor a codX es ', codA);
	writeln('leer x '); readln (x);
	writeln('leer y '); readln (y);
	montoEntre:= montoTot (a, x, y);
	
	writeln('monto total entre los numeros codigo ',x, 'y', y ,'es', montoEntre:2:0);
END.

