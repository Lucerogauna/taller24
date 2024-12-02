{

   casa de comidas
}


program untitled;
type	
	extra= record
		dia: integer;
		cantCombos: integer;
		monto: real;
	end;
	pedido= record
		nroC: integer;
		info: extra;
	end;
	listaPedidos= ^no;
	no= record
		datoL: extra;
		sig: listaPedidos;
		end;
	Earbol= record
		nroCli: integer;
		LP: listaPedidos;
		end;
	arbol=^nodo;
	nodo= record
		dato: Earbol;
		hi, hd: arbol;
	end;
	procedure leer( var p: pedido);
	begin
	writeln ('leer codgo de cliente');readln( p.nroC);
	if p.nroC <> 0 then begin
	writeln ('leer dia pedido');p.info.dia:= random (32);
	writeln ('leer cant combos'); p.info.cantCombos:= random (10);
	writeln ('leer monto');p.info.monto:= random(100);
	end;
	end;
	 procedure agregarALista (var l: listaPedidos; e: extra);
var nue: listaPedidos;
begin
	new (nue);
	nue^.datoL:= e;
	nue^.sig:= l;
	l:= nue;
end;
 procedure agregarA (var a: arbol; d: pedido);
 begin
	if (a= nil ) then begin
		new (a);
		a^.dato.nroCli:= d.nroC;
		a^.dato.LP:= nil;
		agregarALista (a^.dato.LP, d.info);
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin
		if (a^.dato.nroCli = d.nroC ) then
			agregarALista (a^.dato.LP, d.info)
		else if (a^.dato.nroCli > d.nroC ) then
			agregarA (a^.hi, d)
		else 
			agregarA (a^.hd, d)	
	end;
	end;
	procedure cargar (var a: arbol);
	var p: pedido;
	begin
	leer (p);
	while (p.nroC <> 0 ) do begin
		agregarA(a, p);
		leer (p);
	end;
	end;
	procedure imprimirLista (l: listaPedidos);
begin
	while (l<> nil) do begin
		writeln('dia : ', l^.datoL.dia);
		writeln('monto: ', l^.datoL.monto:2:0);
		l:= l^.sig;
	end;
end;
procedure imprimirA (a: arbol);
begin
	if a<> nil then begin
		imprimirA (a^.hi);
		writeln('nro de cliente -->',a^.dato.nroCli);
		imprimirLista(a^.dato.LP);
		imprimirA (a^.hd);
end;
end;
procedure incisoB (a: arbol; x: integer; var l2: listaPedidos);
begin
	if (a<> nil) then begin
		if (a^.dato.nroCli = x) then 
			l2:= a^.dato.LP
		else if (a^.dato.nroCli > x) then
			incisoB(a^.hi, x, l2)
		else 
			incisoB (a^.hd, x,l2);
	end;
end;
{retorne el monto total abonado del cliente}
function montoTotal(l: listaPedidos): real;
var
	cant: real;
	begin
		if (l <> nil) then begin
			cant:=l^.datoL.monto + montoTotal(l^.sig); 
			writeln (cant:2:0);//junta los montos en cant, cuando corta devuelve 
		end;
	montoTotal:= cant;
	end;
	var 
		a: arbol; codX: integer; l2: listaPedidos; mt: real;
BEGIN
	a:= nil;
	cargar(a);
	imprimirA(a);
	writeln('leer codcliente '); readln (codX);
	l2:= nil;
	incisoB (a, codX, l2);
	imprimirLista (l2);
	mt:= montoTotal(l2);
	writeln('monto total del cliente ',mt:2:0);
END.

