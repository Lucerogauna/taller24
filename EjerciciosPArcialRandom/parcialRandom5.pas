{parcialRandom42442
   
}


program untitled;
type
		i = record
			cantPaginas: integer;
			diaYmes: string;
		end;
	documento= record
		codUser: integer;
		extra: i;
		end;
	lista=  ^no;
		no= record
			datoL: i;
			sig: lista;
	end;
	listaCod=  ^nod; 
		nod= record
			doc: documento;
			sig: listaCod;
	end;
		docA= record
			codU: integer;
			info: lista;
		end;
		arbol = ^nodo;
		nodo= record
			dato: docA;
			hi, hd: arbol;
		end;
procedure leer (var d: documento);
begin
 	writeln('leer cod user'); readln(d.codUser);
 	if (d.codUSer<> 0) then begin
 		writeln('leer cantidad de paginas'); readln(d.extra.cantPaginas); 
			writeln('leer dia y mes'); readln(d.extra.diaYmes);
 	end; 
 end;
 procedure agregarALista (var l: lista; e: i);
var nue: lista;
begin
	new (nue);
	nue^.datoL:= e;
	nue^.sig:= l;
	l:= nue;
end;
 procedure agregarA (var a: arbol; d: documento);
 begin
	if (a= nil ) then begin
		new (a);
		a^.dato.codU:= d.codUSer;
		a^.dato.info:= nil;
		agregarALista (a^.dato.info, d.extra);
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin
		if (a^.dato.codU = d.codUSer ) then
			agregarALista (a^.dato.info, d.extra)
		else if (a^.dato.codU > d.codUSer ) then
			agregarA (a^.hi, d)
		else 
			agregarA (a^.hd, d)
			
	end;
	end;
 procedure cargarA (var a: arbol);
 var 
  d: documento;
  begin
	leer(d);
	while (d.codUser <> 0) do begin
		agregarA(a, d);
		leer(d);
	end;
end;

 procedure agregarALista2 (var l: listaCod; codu: integer; info: i);
var nue: listaCod;
begin
	new (nue);
	nue^.doc.codUser:= codu;
	nue^.doc.extra:= info;
	nue^.sig:= l;
	l:= nue;
end;
procedure incisoB (a:arbol; x, y: integer; var l2: listaCod);
begin
	if (a<> nil) then begin
		if ((a^.dato.codU >= x) and (a^.dato.codU <= y)) then begin
			writeln('cumple asi qe agreogo a lista');
			agregarALista2 (l2, a^.dato.codU, a^.dato.info^.datoL);
			incisoB (a^.hi, x, y, l2);
			incisoB (a^.hd, x, y, l2)
		end;
		if (a^.dato.codU < x) then 
			incisoB (a^.hd, x, y, l2)
		else if  (a^.dato.codU < y)  then
			incisoB (a^.hi, x, y, l2);
	end;
end;
procedure  incisoC(l: listaCod; var suma: integer);
begin
	if (l<>nil) then begin
		writeln('cant de paginas',l^.doc.extra.cantPaginas);
		incisoC (l^.sig, suma);
		suma:= suma+  l^.doc.extra.cantPaginas ;
	end;
end;
procedure imprimirLista (l: listaCod);
begin
	while (l<> nil) do begin
		writeln('codigo: ', l^.doc.codUser);
		writeln('cantPaginas: ', l^.doc.extra.cantPaginas);
		l:= l^.sig;
	end;
end;
procedure imprimirA (a: arbol);
begin
	if a<> nil then begin
		imprimirA (a^.hi);
		writeln(a^.dato.codU);
		imprimirA (a^.hd);
end;
end;
VAR a: arbol;listaC:listaCod; x, suma, y: integer;
BEGIN
a:= nil;
cargarA(a);
imprimirA (a);
listaC:= nil;
writeln('leer x e y');
readln(x); readln(y);
incisoB (a, x, y, listaC);
suma:=0;
writeln('imprimir la lista CCCC');
imprimirLista(listaC);
incisoC (listaC, suma);
writeln('la suma es', suma)
END.

