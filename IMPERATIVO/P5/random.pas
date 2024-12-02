{

   
}


program parcialtp;
type
	persona = record
		name: string;
		CantStickers: integer;
		montoTot: real;
		end;
		arbol=^nodo;
		nodo = record
			dato: persona;
			hi, hd: arbol;
		end;
procedure leer(var a: persona);
begin
writeln('name'); readln(a.name);
if a.name <> 'x' then begin
writeln('cant stickers'); a.CantStickers:= random (10);
writeln('montoTot '); a.montoTot:= random(100);
end;
end;
procedure agregarA(var a: arbol; p: persona);
begin
	if (a= nil) then begin
		new (a);
		a^.dato:= p;
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin if (a^.dato.name > p.name) then
		agregarA(a^.hi, p)
	else
		agregarA(a^.hd, p); //los repetidos por defecto van a la derecha
	end;
end;
procedure cargarv (var v: arbol);
var per: persona;
begin
	leer(per);
	while per.name<> 'x' do begin
		agregarA (v, per);
		leer(per);
	end;
end;

procedure imprimirA (a: arbol);
begin
	if a<> nil then begin
		imprimirA(a^.hi);
		writeln('nombre ', a^.dato.name);
		writeln('cant stickerz ', a^.dato.CantStickers);
		imprimirA(a^.hd);
	end;
end;
function cantName(a: arbol; n: string): integer;
var c: integer;
begin
	if (a= nil) then
		c:= 0
	else begin
		if (a^.dato.name = n) then
			c:= a^.dato.CantStickers
		else if(a^.dato.name > n) then
			c:= cantName(a^.hi, n)
		else c:= cantName(a^.hd, n);
	end;
	cantName:= c;
end;
function sumaTot (a: arbol): integer;
begin
	if (a = nil) then
		sumaTot:= 0
	else 
		sumaTot:= a^.dato.CantStickers + sumaTot(a^.hi)+ sumaTot(a^.hd);
	end;
function cantMenoresA (a: arbol; namx: string): integer;
begin
	if (a = nil) then 
		cantMenoresA:=0
	else begin
		if (a^.dato.name< namx) then
			cantMenoresA:= 1 + cantMenoresA(a^.hi, namx) + cantMenoresA(a^.hd, namx)
		else cantMenoresA:= cantMenoresA(a^.hi, namx)
	end;
end;
var a: arbol; c: integer; namex: string;
BEGIN
	a:= nil;
	cargarv(a);
	imprimirA(a);
	writeln('leer name a buscar'); readln(namex);
	c:= cantName(a, namex);
	writeln('la cntidad de stickers de namex es', c);
	c:= sumaTot(a);
	writeln('suma de stcikers de todos', c);
	namex:= 'lucero';
	c:= cantMenoresA(a, namex );
	writeln('la cantidad de personas con < de namex stickers son', c);
	
END.

