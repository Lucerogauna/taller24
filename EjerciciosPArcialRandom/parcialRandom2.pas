{
18/09/2023 IMPORTANTE: Cree un programa en Pascal. Utilice su apellido como nombre del programa y del archivo pas, y guárdelo en el Escritorio de su computadora.
La biblioteca Sarmiento necesita un sistema para obtener estadísticas sobre los libros prestados. De cada préstamo se conoce: el número de préstamo, 
* ISBN del libro y código de socio. La lectura finaliza con código de socio 0 y todos los préstamos realizados a un mismo socio se leen consecutivamente.
a) Implementar un módulo que lea información de los préstamos y genere:
1. Una estructura de datos eficiente para la búsqueda por ISBN del libro.
ii. Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.
b) Implementar un módulo que reciba la estructura generada en a) y un ISBN y retorne la cantidad de préstamos de ese ISBN
c) Realizar un módulo recursivo que reciba la estructura generada en a) li y un valor X y retorne la cantidad de socios con cantidad de préstamos superior al valor X.
NOTA: Implementar el programa principal, que invoque a los incisos a, by c. En caso de ser necesario, puede utilizar los módulos que se encuentran a continuación.
C
V
Enter
 
 
 
 
	writeln(''); readln();  
}


program parcialRandom2;
type
	info = record
	 nroPrestamo: integer;
	 codSocio: integer;
	 end;
	datosL= record
		codSocio: integer;
		cantPrestamos: integer;
		end;
		prestamo = record
		isbnLibro: integer;
		datos: info;
	end;
	{prestamo = record
		isbnLibro: integer;
		datos: datosL
	end;}
	listaArbol =^nodoL2;
	nodoL2= record
		datoL: info;
		sig:listaArbol;
	end;
	{---------------------EE1}
	lista =^nodoL;
	nodoL= record
		datoL: datosL;
		sig: lista;
	end;
	prestamoArbol = record
		isbnLibro: integer;
		datoListaA: listaArbol;
	end;
	Arbol = ^nodo;
	nodo = record
		dato: prestamoArbol;
		hi, hd: Arbol;
	end;
procedure leerDatos (var p: prestamo);
begin
	writeln('cod de socio'); readln(p.datos.codSocio);
	if (p.datos.codSocio <> 0) then begin
	writeln('nro prestamo'); readln(p.datos.nroPrestamo);
	writeln('isbn libro'); readln(p.isbnLibro);
end;
end;
procedure agregarALista (var l: lista; SA: integer; CP: integer);
var nue: lista;
begin
	new (nue);
	nue^.datoL.codSocio:= SA;
	nue^.datoL.cantPrestamos:= CP;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregarALista2 (var l: listaArbol; i: info);
var nue: listaArbol;
begin
	new (nue);
	nue^.datoL:= i;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregoA (var a: Arbol; p: prestamo);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.isbnLibro:= p.isbnLibro;
		a^.dato.datoListaA:= nil;
		agregarALista2(a^.dato.datoListaA, p.datos); // a la lista que esta con el isbn le mando 
		a^.hi:= nil ;a^.hd:= nil
	end
	else begin
		if (a^.dato.isbnLibro = p.isbnLibro) then
			agregarALista2(a^.dato.datoListaA, p.datos) // a la lista que esta con el isbn le mando 
		else if (a^.dato.isbnLibro > p.isbnLibro) then
			agregoA(a^.hi, p)
		else
			agregoA(a^.hd, p);
	end;
end;
procedure cargar(var a: Arbol; var l: lista);
var 
	p: prestamo; SocioActual,cantPrestamos: integer;
begin
	leerDatos(p);
	while (p.datos.codSocio <> 0) do  begin
		writeln(' dato');
		SocioActual:= p.datos.codSocio;
		writeln(SocioActual);
		cantPrestamos:= 0;
		writeln(cantPrestamos);
		while (SocioActual = p.datos.codSocio) do begin
			writeln('agrego aa arbol');
			agregoA(a, p); // normal
			writeln('suma');
			cantPrestamos:= cantPrestamos+1;
			writeln('leo otro dato');
			leerDatos(p);
		end;// del while corte de control;
		
		writeln('la cantidad de prestamos del socio', SocioActual, cantPrestamos);
		agregarALista (l, SocioActual, cantPrestamos); //hago y vuelve al primer while
	end;
end;
function cuentoEnLista (l: listaArbol): integer;
var 
	 c: integer;
	begin
	c:= 0;
	while l<> nil do begin
		c:= c +1;
		l:= l^.sig;
	end;
	cuentoEnLista:= c;
end;
	{ Implementar un módulo que reciba la estructura generada en a) y un ISBN y retorne la cantidad de préstamos de ese ISBN}
	function IncisoB (a: Arbol; isbnX: integer): integer;
	var cant: integer;
	begin
		if (a = nil) then
			cant:= 0
		else 	begin
			if (a^.dato.isbnLibro = isbnX) then
				cant:= cuentoEnLista (a^.dato.datoListaA)
			else if (a^.dato.isbnLibro > isbnX) then
				cant:= IncisoB(a^.hi, isbnX)
			else 
				cant:= IncisoB(a^.hd, isbnX);
			end;
		IncisoB:= cant;
	end ;
{c) Realizar un módulo recursivo que reciba la estructura generada en a) li 
* y un valor X y retorne la cantidad de socios con cantidad de préstamos superior al valor X.}
function IncisoC (l: lista; x: integer): integer;
var cant: integer;
begin
	if (l<> nil) then begin
		if (l^.datoL.cantPrestamos > x) then
			cant:= 1 + (incisoC(l^.sig, x))
		else cant:= incisoC(l^.sig, x)
		end
	else 
		cant:=0;
	IncisoC:= cant;
end;
var a: Arbol; listaII: lista;B, C, codX, codY: integer;
BEGIN
a:= nil; listaII:= nil;
cargar(a, listaII);
	writeln('leer codX a buscar en lista interna de arbol'); readln(codX);  
B:= incisoB (a, codX);
	writeln(' retorne la cantidad de préstamos de ese ISBN', B);
	writeln('leer codY'); readln(codY); 
C:= incisoC (listaII, codY);
	writeln('la cantidad de socios con cantidad de préstamos superior al valor Y', C);
	
	
END.

