{ 3. Implementar un programa modularizado para una librería. Implementar módulos para:
 a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
 código de producto. De cada producto deben quedar almacenados su código, la
 cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
 venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
 ingreso de las ventas finaliza cuando se lee el código de venta-1.
 b. Imprimir el contenido del árbol ordenado por código de producto.
 c. Retornar el código de producto con mayor cantidad de unidades vendidas.
 d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro.
 e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetros
 * preguntar inciso B, C, preguntar inciso E}
program p4e3;
type
	producto= record
		codP: integer;
		cantTotU: integer;
		montoTot: real;
		end;
	venta= record
		codV: integer;
		codProdVendido: integer;
		cantUnidadesVendidas: integer;
		precioUnitario: integer;
		end;
	arbol = ^nodo;
	nodo = record
		dato: producto;
		hi, hd: arbol;
		end;
procedure leer(var v: venta; var p: producto);
begin
	writeln('leer codigo de venta');readln(v.codV);
	if (v.codV <> -1) then begin
		writeln('leer cod de producto vendido');v.codProdVendido:= random(584);//readln(v.codProdVendido); 
		p.codP:= v.codProdVendido;
		writeln('leer cant de unidades vendidas');v.cantUnidadesVendidas:= random(101);//readln(v.cantUnidadesVendidas); 
		p.cantTotU:= v.cantUnidadesVendidas;
		writeln('leer precio unitario');v.precioUnitario:= random(50);//readln(v.precioUnitario); 
		p.montoTot:= v.cantUnidadesVendidas * v.precioUnitario;
	end;
end;
procedure agregarArbol (var a: arbol; p: producto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codP:= p.codP;
		a^.dato.cantTotU:= p.cantTotU;
		a^.dato.montoTot:= p.montoTot;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if (a^.dato.codP = p.codP) then begin //acordarse de considerar los casos que son iguales!!!, a no ser que diga los datos repetidos van a la derecha del arbol
			a^.dato.cantTotU:=a^.dato.cantTotU + p.cantTotU;
			a^.dato.montoTot:= a^.dato.montoTot + p.montoTot //no hace falta calcular porque ya lo hago al leer
		end
		else if (a^.dato.codP > p.codP ) then
			agregarArbol (a^.hi, p)
		else
			agregarArbol (a^.hd, p)
	end;
			
end;
procedure cargarArbol (var a: arbol);
var
	p: producto; 
	v: venta;
begin
	leer(v, p);
	while (v.codV<> -1) do begin
		agregarArbol(a, p);
		leer(v, p);
	end;
end;
procedure imprimirContenido(p: producto);
begin
		writeln(' /////codigo de producto------->', p.codP);
		writeln(' Cant totales de unidades vendidas:', p.cantTotU);
		writeln(' monto total', p.montoTot:2:0);
end;
procedure imprimirOrdenado (a: arbol);
begin
	if (a<> nil) then begin
		imprimirOrdenado(a^.hi);
		imprimirContenido(a^.dato);
		imprimirOrdenado(a^.hd);
	end;
end;
{c. Retornar el código de producto con mayor cantidad de unidades vendidas.}
procedure MaxCantVendidasSI (a: arbol; var max: integer; var codMax: integer);
begin 
 //no have falta hacer a= nil, con a<> nil no hace nada
	if (a <> nil) then begin
		if (a^.dato.cantTotU > max) then begin
			max:= a^.dato.cantTotU;
			codMax:= a^.dato.codP
		end;
		MaxCantVendidasSI(a^.hi, max, codMax);
		MaxCantVendidasSI(a^.hd, max, codMax);
	end;
	end;

{ d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro.}
 function MenorA(a: arbol; x: integer): integer;
 var cant: integer;
 begin
	if a= nil then
		cant:=0
	else begin
		if (a^.dato.codP < x) then //  Recorro los dos lados hasta que no se cumple esa condicion
			cant:= 1 +  MenorA(a^.hi, x )+MenorA(a^.hd, x )
		else
			cant:= MenorA(a^.hi, x )
		end;
	MenorA:= cant;
 end;
{ e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetros}
 function MontoTotalEntre (a: arbol; x, y: integer): real;
 var 
  suma: real;
 begin
	if (a= nil) then
		suma:= 0
	else begin
		if ((a^.dato.codP > x) and (a^.dato.codP < y)) then
			suma:= suma +  a^.dato.montoTot + MontoTotalEntre(a^.hi, x, y)+MontoTotalEntre(a^.hd, x, y)
		else if (a^.dato.codP >= y) then //ver (creo bien)
			suma:= MontoTotalEntre(a^.hi, x, y)
		else if (a^.dato.codP <=x) then
				suma:= MontoTotalEntre(a^.hd, x, y)
		end;
	MontoTotalEntre:= (suma);
 end;
 function cantEntre (a: arbol;x,y: integer): integer;
 var 
	cant:integer;
 begin
	if (a= nil) then
	  cant:= 0
	else begin 
	if (a^.dato.codP> x) and (a^.dato.codP<y) then
		cant:= 1 + cantEntre(a^.hi, x, y )+ cantEntre(a^.hd, x, y )
	else if (a^.dato.codP> x) then
		cant:= cantEntre(a^.hd, x, y )
	else if (a^.dato.codP<y) then
		cant:= cantEntre(a^.hi,x, y )
 end;
 cantEntre:= cant;
 end;
var 
	a: arbol;max, codMax, x, y: integer; incisoE: real; incisoRandom: integer;
BEGIN
	cargarArbol(a);
	writeln('se cargo el arbol');
	imprimirOrdenado(a);
	max:= -1;
	MaxCantVendidasSI(a, max, codMax);
	writeln('el codigo del producto con mas productos vendidos ',codMax);
	writeln('leer valor x'); readln(x);
	writeln('leer valor y'); readln(y);
	incisoE:= MontoTotalEntre(a, x, y);
	writeln('el monto total entre los rangos ', x,'y', y, 'es de', incisoE);

	writeln('leer valor x'); readln(x);
	writeln('leer valor y'); readln(y);
	incisoRandom:=cantEntre(a, x, y);
	writeln('el cantidad de productos entre los rangos ', x,'y', y, 'es de', incisoRandom);
END.

