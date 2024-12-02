{ 4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
 durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
 y mesdel préstamo y cantidad de días prestados. Implementar un programa con:
 a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
 los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
 ser eficientes para buscar por ISBN.
 i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
 insertarlos a la derecha.
 ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
 (prestar atención sobre los datos que se almacenan).
 b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
 grande.
 c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
 pequeño.
 d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
 e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
 f.
 Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
 que se prestó.
 g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
 que se prestó.
 h. Unmódulorecursivo que reciba la estructura generada en g. y muestre su contenido.
 i.
 Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos).
 j.
 Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos)
   
   
}


program p4e4;
type
	extra= record
		nroSocio: integer;
		diames: integer;
		diasPrestados: integer;
	end;
	lista = ^no;
	no= record
		dato: extra;
		sig: lista;
		end;
	prestamoYLista = record
		isbn: integer;
		info: lista;
		end;
	prestamoCompleto = record
		isbn: integer;
		adicional: extra;
	  end;
	arbol2= ^nodo2;
	nodo2= record
		dato2: prestamoYLista;
		hi, hd: arbol2;
		end;
	arbol= ^nodo;
	nodo= record
		dato: prestamoCompleto;
		hi, hd: arbol;
		end;
procedure leerP (var p: prestamoCompleto);
begin
	writeln('leer isbn '); readln(p.isbn);
	if p.isbn <>0 then begin
	writeln('leer nro socio '); readln(p.adicional.nroSocio);
	writeln('leer dia mes '); readln(p.adicional.diames);
	writeln('leer dias prestados '); readln(p.adicional.diasPrestados);
		
	end;
end;
{ i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
 insertarlos a la derecha.}
 procedure agregarA1(var a: arbol; p: prestamoCompleto);
 begin
	if (a= nil) then begin
		new(a);
		a^.dato:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else if ( p.isbn >= a^.dato.isbn) then 
		agregarA1(a^.hd, p)
	else
		agregarA1(a^.hi, p)
 end;
{ ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
 (prestar atención sobre los datos que se almacenan).}
 procedure agregarALista (var l: lista; dat: extra);
var nue: lista;
begin
 new (nue);
 nue^.dato:= dat;
 nue^.sig:= l;
 l:= nue;
end;
procedure agregarA2 ( var a2: arbol2; isbn: integer; infoA: extra);
begin
	if (a= nil ) then begin
		new (a);
		a2^.dato2.isbn:= isbn;
		agregarALista(a2^.dato2.info, infoA);
	end
	else begin
		if (a2^.dato2.isbn = isbn) then
		agregarALista(a2^.dato2.info, infoA);
	else if (a2^.dato2.isbn > isbn) then
		agregarA2(a2^.hi, isbn, infoA)
	else 
		agregarA2(a2^.hd, isbn, infoA)
	end
end;
procedure cargarA(var a: arbol; var a2: arbol2; );
var v: prestamoCompleto;
begin
	 leer(v);
	 while v.isbn <>0 do begin
	 agregarA1(a, v);
	 agregarA2(a2, v.nroSocio,v.adicional);
	 leer(v);
	end;
end;

BEGIN
	
	
END.

