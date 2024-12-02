{
2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}


program untitled;
type
	rango = 2010..2018;
	infoA2= record
		patente: string;
		modelo: string;
		anio: rango;
		end;
		
 infoA= record
	otro: infoA2;
	marca: string;
	end;
	
	arbol= ^nodo;
	nodo = record
		dato: infoA;
		hi, hd: arbol;
	end;
	
	lista=^nodoL;
	nodoL = record
		dato: infoA2;
		sig: lista;
		end;
		
	lista2=^nodoL2;
	nodoL2 = record
		dato: infoA;
		sig: lista2;
		end;
		
	estructura2= record
		marca : string;
		listaM: lista;
		end;
		
	arbol2= ^nodo2;
	nodo2 = record
		dato2: estructura2;
		hi, hd : arbol2;
	end;
	
vectorAnio= array [rango] of lista2;


procedure leer(var a: infoA);
begin
	writeln('leer marca '); readln(a.marca);
	if (a.marca <> 'MMM') then begin
	writeln('leer patente '); readln(a.otro.patente);
	writeln('leer año fabricacion '); readln(a.otro.anio);
	writeln('leer modelo '); readln(a.otro.modelo);
	end;
end;


procedure agregarA1(var a: arbol; dato: infoA);
begin
	if (a= nil) then begin
		new(a);
		a^.dato:= dato;
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin
		if (dato.otro.patente > a^.dato.otro.patente ) then
		agregarA1(a^.hd, dato)
		else 
		agregarA1(a^.hi, dato)
	end;
end;


procedure agregarALista(var l: lista; info: infoA2);
var nue: lista;
begin
	new (nue);
	nue^.dato:= info;
	nue^.sig:= l;
	l:= nue;
end;

procedure agregarA2(var a: arbol2; dato: infoA);
begin
	if (a= nil) then begin
		new(a);
		a^.dato2.marca:= dato.marca;
		a^.dato2.listaM := NIL;
		agregarALista (a^.dato2.listaM, dato.otro);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if (dato.marca = a^.dato2.marca ) then
			agregarALista (a^.dato2.listaM, dato.otro)
		else if (dato.marca > a^.dato2.marca ) then
		agregarA2(a^.hd, dato)
		else 
		agregarA2(a^.hi, dato)
	end;
end;

procedure cargarA(var a: arbol; var a2: arbol2);
var autos: infoA;
begin
	leer(autos);
	while autos.marca <> 'MMM' do begin
		agregarA1(a, autos);
		agregarA2 (a2, autos);
		leer(autos);
	end;
end;
procedure imprimirContenido(p: infoA);
begin
		writeln(' /////marca------->', p.marca);
		writeln(' patente :', p.otro.patente);
end;
procedure imprimirOrdenado (a: arbol);
begin
	if (a<> nil) then begin
		imprimirOrdenado(a^.hi);
		imprimirContenido(a^.dato);
		imprimirOrdenado(a^.hd);
	end;
end;
{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia
* (arbol prdenadp por patente).}
function cantMarca(a: arbol; marx: string): integer;
var 
 cant: integer;
begin
	if (a = nil) then 
	 cant:=0
	else begin
		if (a^.dato.marca = marx) then 
		cant:= 1 + cantMarca(a^.hi, marx) + cantMarca(a^.hd, marx) // recorro todo el arbol
		else 
		cant:= cantMarca(a^.hi, marx) + cantMarca(a^.hd, marx)
	end;
cantMarca:= cant;
end;


function contarEnLista (l: lista): integer;
var 
	cant: integer;
begin
	cant:= 0;
	while l<>nil do begin
		cant:= cant +1;
		l:=l^.sig;
	end;
contarEnLista:= cant;
end;
{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}
function cantMarca2(a: arbol2; marx: string): integer;
var 
 cant: integer;
begin
	if (a = nil) then begin
	 cant:=0;
	 end
	else begin
		if (a^.dato2.marca = marx) then begin
			cant:= contarEnLista(a^.dato2.listaM)
		end
		else if  (a^.dato2.marca > marx ) then
			cant:= cantMarca2(a^.hi, marx)
		else then
			cant:=  cantMarca2(a^.hd, marx)
	end;
cantMarca2:= cant;
end;
{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}
procedure agregarALista2(var l: lista2; info: infoA);
var nue: lista2;
begin
	new (nue);
	nue^.dato:= info;
	nue^.sig:= l;
	l:= nue;
end;
procedure incisoD (a: arbol; var v: vectorAnio; var l: lista2);
begin
// acordate de inicializar el vector de listas en NIL!!! (pp)
	if (a<>nil) then begin
		incisoD(a^.hd, v, l);
		agregarALista2(v[a^.dato.otro.anio], a^.dato);
		incisoD(a^.hi, v, l);
	end;
end;
{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}
function ModeloPatenteX (a: arbol; pat: string): string;
var 
 modelo: string;
 begin
	if (a= nil) then
		modelo:= 'no existe'
	else begin
		if (a^.dato.otro.patente = pat) then
			modelo:= a^.dato.otro.modelo
		else if 
			 (a^.dato.otro.patente < pat) then
			 modelo:= ModeloPatenteX(a^.hd, pat)
			else
			 modelo:= ModeloPatenteX(a^.hi, pat)
 end;
 ModeloPatenteX:= modelo;
 end;
 {
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
procedure VeoEnLista (l: lista; p: string; var ok: boolean; var modeloEncontrado: string);
begin
	while (l<>nil) do begin
	if  (l^.dato.patente <> p) then 
		l:= l^.sig;
	end;
	if (l^.dato.patente= p) then begin
		ok:= true;
		modeloEncontrado:= l^.dato.modelo
	end
	else
	 ok:= false;
end;
function modelo2 (a: arbol2; patente: string): string;
var 
catnt: string; ok: boolean;
begin
	if (a= nil) then
	catnt:= 'no existe tal'
	else begin
		catnt:= modelo2 (a^.hi, patente);
		VeoEnLista (a^.dato2.listaM, patente, ok, catnt);
		if ok = true then
			catnt:= a^.dato2.listaM^.dato.modelo
		else if (not ok) then 
		catnt:= modelo2 (a^.hd, patente);
	end;
	modelo2:=catnt;
end;
var a: arbol; a2: arbol2;cantAutos: integer;mx, MP: string;
pat: string;
BEGIN
	a:= nil; a2:= nil;
	cargarA(a, a2);
	imprimirOrdenado(a);
	writeln('leer marc'); read (mx);
	cantAutos:= cantMarca(a, mx);
	writeln('la cantidad de autos marca ', mx, 'es de:', cantAutos);
	writeln('leer patente');
	readln(pat);
	readln(pat);
	MP:= ModeloPatenteX(a, pat);
	writeln('e´l modelo de la patente  es:', MP);
	
	
END.

