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
	Enuevo= record
		isbn: integer;
		cantVecesP: integer;
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
	arbol3= ^nodo3;
	nodo3= record
		dato3: Enuevo;
		hi, hd: arbol3;
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
	writeln('leer nro socio ');p.adicional.nroSocio:= random (101); //readln(p.adicional.nroSocio);
	writeln('leer dia mes '); p.adicional.diames:= random(32);//readln(p.adicional.diames);
	writeln('leer dias prestados '); p.adicional.diasPrestados:= random (32);//readln(p.adicional.diasPrestados);
		
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
	if (a2= nil ) then begin
		new (a2);
		a2^.dato2.isbn:= isbn;
		agregarALista(a2^.dato2.info, infoA);
	end
	else begin
		if (a2^.dato2.isbn = isbn) then
		agregarALista(a2^.dato2.info, infoA)
	else if (a2^.dato2.isbn > isbn) then
		agregarA2(a2^.hi, isbn, infoA)
	else 
		agregarA2(a2^.hd, isbn, infoA)
	end
end;
procedure cargarA(var a: arbol; var a2: arbol2);
var v: prestamoCompleto;
begin
	 leerP(v);
	 while (v.isbn <>0) do begin
	 agregarA1(a, v);
	 agregarA2(a2, v.isbn,v.adicional);
	 leerP(v);
	end;
end;
{ b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
 grande.}
 function isbnMax (a: arbol): integer;
 var isbnm: integer;
 begin
	if (a= nil) then
		isbnm:= -1
	else if (a^.hd = nil) then
						isbnm:= a^.dato.isbn
			else
					isbnm:= isbnMax(a^.hd);
	isbnMax:= isbnm;
 end;
 {c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
 pequeño.}
  function isbnMin (a: arbol2): integer;
 var isbnm: integer;
 begin
	if (a= nil) then
		isbnm:= -1
	else if (a^.hi = nil) then
						isbnm:= a^.dato2.isbn
			else
					isbnm:= isbnMin(a^.hi);
	isbnMin:= isbnm;
 end;
 { d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
 function CantPrestamosSocioX(a: arbol; x: integer): integer;
 var cant: integer;
 begin
	if (a= nil) then
		cant:= 0
	else begin
		if (a^.dato.isbn = x) then
			cant:=  1 + CantPrestamosSocioX(a^.hd, x)
		else if (a^.dato.isbn > x) then
			cant:= CantPrestamosSocioX(a^.hi, x)
		else 
			cant:= CantPrestamosSocioX(a^.hd, x)
	end;
	CantPrestamosSocioX:= cant;
 end;
 {e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
 módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
 function contarCantLista (l: lista): integer;
 var
   suma: integer;
 begin
	suma:= 0;
	while (l<>nil) do begin 
		suma:= suma+1;
		l:=l^.sig;
	end;
	contarCantLista:=suma;
 end;
 function CantPrestamosSocioXarbol2(a: arbol2; x: integer): integer;
 var cant: integer;
 begin
	if (a= nil) then
		cant:= 0
	else begin
		cant:=cant + contarCantLista (a^.dato2.info);
		cant:= CantPrestamosSocioXarbol2(a^.hi, x);
		cant:= CantPrestamosSocioXarbol2(a^.hd, x);
	end;
	CantPrestamosSocioXarbol2:= cant;
 end;
 { f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
 que se prestó.}
 procedure agregarA3(var a3: arbol3; isbn, cantVeces: integer);
 begin
	if (a3 = nil) then begin
		a3^.dato3.isbn:= isbn;
		a3^.dato3.cantVecesP:= cantVeces;
		a3^.hi:= nil; 
		a3^.hd:= nil;
	end
	else begin
	if (a3^.dato3.isbn = isbn) then
		a3^.dato3.cantVecesP:=a3^.dato3.cantVecesP + cantVeces
	else if (a3^.dato3.isbn > isbn) then
		agregarA3(a3^.hi, isbn, cantVeces)
	else
		agregarA3(a3^.hd, isbn, cantVeces)
	end;
 end;
 procedure incisoF(a: arbol; var a3: arbol3);
 begin
	if a<>nil then begin
		agregarA3 (a3, a^.dato.isbn, 1);
		incisoF(a^.hi, a3);
		incisoF(a^.hd, a3);
	end;
 end;
 { g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.}
  procedure agregarA4(var a4: arbol3; isbn: integer);
 begin
	if (a4 = nil) then begin
		a4^.dato3.isbn:= isbn;
		a4^.dato3.cantVecesP:= 1;
		a4^.hi:= nil; 
		a4^.hd:= nil;
	end
	else begin
	if (a4^.dato3.isbn = isbn) then
		a4^.dato3.cantVecesP:=a4^.dato3.cantVecesP + 1
	else if (a4^.dato3.isbn > isbn) then
		agregarA4(a4^.hi, isbn)
	else
		agregarA4(a4^.hd, isbn)
	end;
 end;
  procedure incisoG(a: arbol; var a4: arbol3);
 begin
	if a<>nil then begin
		agregarA4 (a4, a^.dato.isbn);
		incisoF(a^.hi, a4);
		incisoF(a^.hd, a4);
	end;
 end;
  {h. Unmódulorecursivo que reciba la estructura generada en g. y muestre su contenido.}
   procedure imprimirContenido( e: Enuevo);
 begin
  writeln('///////////////////');
   writeln('isbn', e.isbn);
   writeln('cant de veces prestados',e.cantVecesP);
 end;
 procedure imprimirArbolOrdenado (a4: arbol3);
 begin
   if (a4<> nil) then begin
     imprimirArbolOrdenado(a4^.hi);
     imprimirContenido(a4^.dato3);
     imprimirArbolOrdenado(a4^.hd);
   end;
 end;
 { i.
 Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos).}
 function cantEntre (a: arbol; x: integer; y: integer):integer;
 var
 cant: integer;
 begin
	if (a= nil) then
		cant:= 0
	else begin
	if (a^.dato.isbn>=x) and (a^.dato.isbn<=y) then
		cant:=  1 + cantEntre(a^.hi, x, y) +cantEntre(a^.hd, x, y) 
	else if (a^.dato.isbn<= x) then
			cant:=cantEntre(a^.hd, x, y) 
	else if (a^.dato.isbn>=y) then
			cant:=cantEntre(a^.hi, x, y)
		end;
	cantEntre:= cant; 
end;
{ j.
 Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
 comprendidos entre los dos valores recibidos (incluidos)
   }
    function cantEntre2 (a: arbol2; x: integer; y: integer):integer;
 var
 cant: integer;
 begin
	if (a= nil) then
		cant:= 0
	else begin
	if (a^.dato2.isbn>=x) and (a^.dato2.isbn<=y) then
		cant:=  contarCantLista(a^.dato2.info) + cantEntre2(a^.hi, x, y) +cantEntre2(a^.hd, x, y) 
	else if (a^.dato2.isbn<= x) then
			cant:=cantEntre2(a^.hd, x, y) 
	else if (a^.dato2.isbn>=y) then
			cant:=cantEntre2(a^.hi, x, y)
		end;
	cantEntre2:= cant; 
end;
VAR 
	a1: arbol;
	a2: arbol2;
	codMaxArbol1, x,cantP: integer;
BEGIN
	cargarA(a1, a2);
	codMaxArbol1:= isbnMax(a1);
	writeln('el codigo mas alto leido es ', codMaxArbol1);
	writeln('leer socio x ');
	readln(x);
	cantP:= CantPrestamosSocioX(a1, x);
	writeln('cant de prestamos del socio',x, cantP);
END.

