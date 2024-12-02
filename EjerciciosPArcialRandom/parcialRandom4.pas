{
TURNO D-TEMA 2
Módulo Imperativo
12/09/2023 IMPORTANTE: Cree un programa en Pascal. Utilice su apellido como nombre del programa y del archivo .pas, y guardelo en el Escritorio de su computadora.
Aerolíneas Argentinas necesita procesar los pasajes vendidos durante 2023.
*  De cada pasaje se conoce el código de vuelo, código del cliente, código ciudad destino y monto del pasaje.
a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para la búsqueda por código de ciudad destino,
*  donde para cada código de ciudad destino se almacenan juntos todos los pasajes (código de vuelo, código de cliente y monto del pasaje).
*  La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje().
b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.
c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor cantidad de pasajes vendidos.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
   
}


program untitled;
type
	extra = record
		codV: integer;
		codC: integer;
		monto: real;
	end;
	pasaje = record
		codCiudadDestino: integer;
		i:extra;
		end;
	listaPasajes=  ^no;
	no= record
		datoL: extra;
		sig: listaPasajes;
	end;
	eArbol= record
		codCDestino: integer;
		info: listaPasajes;
	end;
	arbol = ^nodo;
	nodo= record
		dato: eArbol;
		hi, hd: arbol;
	end;
procedure leerPasaje (var p: pasaje);
begin
 	writeln('leer monto pasaje'); readln(p.i.monto);
 	if (p.i.monto<> 0) then begin
 		writeln('leer cofigo ciudad destino'); readln(p.codCiudadDestino); 
			writeln('leer codVuelo'); p.i.codV:= random (102);
			writeln('leerCodifo cliente'); p.i.codC:= random (100);  
 	end; 
end;
procedure agregarALista (var l: listaPasajes; i: extra);
var nue: listaPasajes;
begin
	new (nue);
	nue^.datoL:= i;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregoA (var a: arbol; p: pasaje);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.codCDestino:= p.codCiudadDestino;
		a^.dato.info:= nil;
		agregarALista(a^.dato.info, p.i); // a la lista que esta con el isbn le mando 
		a^.hi:= nil ;a^.hd:= nil
	end
	else begin
		if (a^.dato.codCDestino = p.codCiudadDestino) then
		agregarALista(a^.dato.info, p.i) // a la lista que esta con el isbn le mando 
		else if (a^.dato.codCDestino > p.codCiudadDestino) then
			agregoA(a^.hi, p)
		else
			agregoA(a^.hd, p);
	end;
end;
procedure cargarA (var a: arbol);
var p: pasaje;
begin
	leerPasaje (p);
	while (p.i.monto <> 0) do begin
		agregoA(a, p);
		leerPasaje(p);
	end;
end;
{b) Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.}
procedure hacerEnLista (l:listaPasajes ; var l3: listaPasajes);
begin
	l3^:=l^;
end;
procedure incisoB (a: arbol; codX: integer; var l3: listaPasajes);
begin
	if (a=nil) then 
		l3:= nil
	 else begin
		if (a^.dato.codCDestino = codX) then
			l3:= a^.dato.info
		else if (a^.dato.codCDestino > codX) then
			incisoB (a^.hi,codX,  l3)
		else
			incisoB (a^.hd, codX, l3);
	end;
end;
{c) Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor cantidad de pasajes vendidos.}
 
function cuentoEnLista (l: listaPasajes): integer;
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


procedure IncisoC (a: arbol;var codMax: integer; var max: integer);
begin
	if (a <> nil) then begin
		if (cuentoEnLista(a^.dato.info) >max) then begin
			max:= cuentoEnLista(a^.dato.info);
			codMax:= a^.dato.codCDestino;
		end;
		incisoC(a^.hi, codMax, max);
		incisoC(a^.hd, codMax, max);
	end;
end; 
 procedure imprimirL(l: listaPasajes);
begin
	while l<> nil do begin
		writeln(' /////codigo de venta', l^.datoL.codV);
		writeln(' Cod cliente:', l^.datoL.codC);
		writeln(' monto pasaje', l^.datoL.monto:2:0);
		l:= l^.sig;
end;
end;
procedure imprimirOrdenado (a: arbol);
begin
	if (a<> nil) then begin
		imprimirOrdenado(a^.hi);
		writeln('cod de ciudad destino -->', a^.dato.codCDestino);
		imprimirL(a^.dato.info);
		imprimirOrdenado(a^.hd);
	end;
end;
var a: arbol; codX,max, CM: integer; l3: listaPasajes;
BEGIN
a:= nil;
cargarA(a);
imprimirOrdenado(a);
	max:= -1;
IncisoC(a, CM, max);
writeln('el codigo de ciudad destino con mayor cantidad de pasajes vendidps es :', CM);
writeln('cod x'); readln(codX);
IncisoB(a, codX, l3);
imprimirL(l3);
	
END.

