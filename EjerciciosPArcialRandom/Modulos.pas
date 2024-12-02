{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI
* busqueda ordenada bajo ese criterio.}
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
		else if 
			(a^.dato.codP <= x)  then  //preguntar si van invertidos los if else . Caso limite en papel
				suma:= MontoTotalEntre(a^.hd, x, y)
			else if (a^.dato.codP => y) then
				suma:= MontoTotalEntre(a^.hi, x, y)
		end;
	MontoTotalEntre:= (suma);
 end;
 { e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetro.
  Que pasa si tengo los repetidos del lado derecho}
 function MontoTotalEntre (a: arbol; x, y: integer): real;
 var 
  suma: real;
 begin
	if (a = nil) then
		suma:= 0
	else begin
		if ((a^.dato.codP >= x) and (a^.dato.codP <= y)) then
			suma:= suma +  a^.dato.montoTot + MontoTotalEntre(a^.hi, x, y)+MontoTotalEntre(a^.hd, x, y)
		else if 
			(a^.dato.codP < x) then
				suma:= MontoTotalEntre(a^.hd, x, y)
			else if (a^.dato.codP > y) then
				suma:= MontoTotalEntre(a^.hi, x, y)
		end;
	MontoTotalEntre:= (suma);
 end;

 procedure imprimirContenido(p: productoArbol);
begin
		writeln(' /////codigo de producto------->', p.cod);
		writeln(' Cant stock:', p.stock);
		writeln(' precio', p.precioU:2:0);
end;
procedure imprimirOrdenado (a: arbol);
begin
	if (a<> nil) then begin
		imprimirOrdenado(a^.hi);
		imprimirContenido(a^.dato);
		imprimirOrdenado(a^.hd);
	end;
end;
{BUSCAR MAXIMO X EN TODO EL ARBOL(EL ARBOL NO ESTA ORDENADO ASI QUE RECORRO TODO)}
* procedure IncisoC (a: arbol;var codMax: integer; var max: integer);
begin
	if (a <> nil) then begin // si el arbol no se termina 
		if (cuentoEnLista(a^.dato.info) >max) then begin //chequeo condicion
			max:= cuentoEnLista(a^.dato.info); //en este caso recorro una lista y me fijo la cantidad 
			codMax:= a^.dato.codCDestino;
		end;
		incisoC(a^.hi, codMax, max); //sigo recorriendo
		incisoC(a^.hd, codMax, max);
	end;
end; 
