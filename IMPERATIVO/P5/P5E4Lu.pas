{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.
   
}


program P5E4;
type
	rangoAnio = 2010..2025;
	infoA = record
		anio: integer;
		tipoR: string;
		cod: integer;
	end;
	reclamo = record
		info: infoA;
		dni: integer;
	end;
	lista = ^nodol; //lista para los reclamos realizados por dni 
	nodol= record
		dato: infoA;
		sig: lista;
		end;
	reclamoArbol= record //el arbol tiene dni, lista con los reclamos que hizo, y cantidad total de reclamos
		dni: integer;
		cantReclamos: integer;
		listaR : lista;
		end;
	arbol =^nodo;
	nodo= record
		dato: reclamoArbol;
		hi, hd: arbol;
	end;
	listaCodigos=^nodoD;
	nodoD= record
		cod: integer;
		sig: listaCodigos;
	end;
procedure leerR (var r: reclamo);
begin
	writeln('leer codigo'); readln (r.info.cod);
	if r.info.cod <> 0 then begin
	writeln('leer dni'); readln (r.dni);
	writeln('leer anio'); r.info.anio:= random (1000);//readln (r.info.anio);
	writeln('leer tipoR');readln (r.info.tipoR);
		
	end;
end;
{a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.}
procedure agregarLista(var l:lista; dat: infoA);
var nue: lista;
begin
	new (nue);
	nue^.dato:= dat;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregarA(var a: arbol; r:reclamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni:= r.dni;
		a^.dato.listaR:= nil;
		agregarLista(a^.dato.listaR, r.info);
		a^.dato.cantReclamos:= 1
	end
	else begin
		if (a^.dato.dni= r.dni) then begin
			agregarLista(a^.dato.listaR, r.info);
			a^.dato.cantReclamos:= a^.dato.cantReclamos+ 1
		end
		else if (a^.dato.dni> r.dni) then
			agregarA(a^.hi, r)
		else 
			agregarA(a^.hd, r)
		end;
end;
procedure cargar (var a: arbol);
var 
 r: reclamo;
BEGIN
	leerR(r);
	while (r.info.cod<> 0 ) do begin
		agregarA (a, r);
		leerR(r);
	end;
	
	write('Fin de la lectura');
END;
{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.}
function cantReclamosDniX (a:arbol; dnix: integer): integer;
var cant: integer;
begin
	if (a= nil) then
		cant:= 0
	else begin
		if (a^.dato.dni = dnix) then
			cant:= a^.dato.cantReclamos
		else if (a^.dato.dni > dnix) then
			cant:= cantReclamosDniX(a^.hi, dnix)
		else 
			cant:= cantReclamosDniX(a^.hd, dnix);
		end;
	cantReclamosDniX:= cant;
end;
{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}
 //di por hecho que incluia los dni
function EntreDnis (a:arbol; dniX, dniY: integer): integer;
var 
	cant: integer;
begin
	if (a= nil) then
		cant:= 0
	else begin
		if ((a^.dato.dni >= dniX) and (a^.dato.dni <= dniY)) then
			cant:= a^.dato.cantReclamos + EntreDnis(a^.hi, dniX, dniY) + EntreDnis(a^.hd, dniX, dniY) 
		else if (a^.dato.dni < dniY) then
			cant:= EntreDnis(a^.hi, dniX, dniY) 
		else if (a^.dato.dni > dniX) then
			cant:=EntreDnis(a^.hd, dniX, dniY) 
	end;
	EntreDnis:= cant;
end;


{d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}
procedure agregoAlistaNueva(c: integer; var nl: listaCodigos);
var nue: listaCodigos;
begin
	new (nue);
	nue^.cod:= c;
	nue^.sig:= nl;
	nl:= nue;
end;
procedure recorroLista (anx: integer; l: lista; var nuevaL: listaCodigos);
begin
	while (l<> nil) do begin
		if (l^.dato.anio = anx) then
			agregoAlistaNueva(l^.dato.cod, nuevaL);
		l:= l^.sig;
	end;
end;
procedure incisoD(a: arbol; var l: listaCodigos; anioX: integer);
begin
	if (a<> nil) then begin
		incisoD(a^.hi, l, anioX);
		recorroLista (aniox, a^.dato.listaR, l);
		incisoD(a^.hd, l, anioX);
	end;
end;
{------------------------------------}
procedure imprimirLista (l: listaCodigos);
begin
	while (l<> nil) do begin
		writeln('cod: ', l^.cod);
		l:= l^.sig;
	end;
end;
procedure imprimirArbolOrdenado(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbolOrdenado(a^.hi);
		writeln('el dni es', a^.dato.dni);
		writeln('la cantidad de reclamos es', a^.dato.cantReclamos);
		imprimirArbolOrdenado(a^.hd);
end;
end;
VAR
	a: arbol; 
	dniX, incisoB,incisoC, anio, dniY: integer;
	l: listaCodigos;
BEGIN
	a:=nil;
	l:= nil;
	cargar(a);
	imprimirArbolOrdenado(a);
	writeln('leer dnix'); 
	readln (dniX);
	incisoB:= cantReclamosDniX(a, dniX);
	writeln('la cantidad de reclamos de', dniX, 'es de :', incisoB);
	writeln('leer dnix'); readln (dniX);
	writeln('leer dniY'); readln (dniY);
	incisoC:= EntreDnis (a, dniX, dniY);
	writeln('la cantidad de reclamos entre', dniX,'y', dniY , 'es de :', incisoC);
	
	writeln('leer anio'); readln (anio);
	incisoD(a, l, anio);
	imprimirLista(l);
END.

