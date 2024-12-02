{1.
 a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
 código de producto. De cada producto deben quedar almacenados su código, la
 cantidad total de unidades vendidas y el monto total. De cada venta se cargan código
 de venta, código del producto vendido, cantidad de unidades vendidas y precio
 unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
 b. Imprimir el contenido del árbol ordenado por código de producto.
 c. Retornar el menor código de producto.
 d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro.
 e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
 valores recibidos (sin incluir) como parámetros.
 * 
 * 
 * preguntar cant menor a y monto entre}


program P4E1;
type
  prod= record
    cod: integer;
    cantTotUnid: integer;
    montoTot: real;
    end;
  venta= record 
    codVenta: integer;
    codProd: integer;
    cantUV: integer;
    precioU: real;
  end;
  arbol= ^nodo;
  nodo= record
    dato: prod;
    hi, hd: arbol;
  end;
  procedure leerVenta(var v: venta);
  begin
  writeln('leer codigo venta'); readln(v.codVenta);
  if v.codVenta <>0 then begin
    writeln('leer codigo de producto'); readln(v.codProd);
    writeln('leer cant unidades vendidas'); readln(v.cantUV);
    writeln('leer precio por unidad'); readln(v.precioU);
    end;
  end;
  procedure agregarA(var a: arbol; codi: integer; unidades: integer; mont: real);
  begin
    if (a= nil) then begin 
    new(a); 
    a^.dato.cod:= codi; 
    a^.dato.cantTotUnid:= unidades;
    a^.dato.montoTot:= mont * unidades;
    a^.hi:=nil; a^.hd:= nil;
    end
   else begin
     if (a^.dato.cod = codi) then begin
       a^.dato.montoTot:= a^.dato.montoTot + (mont * unidades);
       a^.dato.cantTotUnid:=  a^.dato.cantTotUnid + unidades;
     end
     else if (a^.dato.cod > codi) then
       agregarA(a^.hi, codi, unidades, mont)
     else 
       agregarA(a^.hd, codi, unidades, mont);
   end;
  end;
procedure cargarA (var a: arbol);
var
  vent: venta;
begin
  leerVenta(vent);
  while (vent.codVenta <> 0) do begin
    agregarA(a, vent.codProd, vent.cantUV, vent.precioU);
    leerVenta(vent);
  end;
end;
{
 b. Imprimir el contenido del árbol ordenado por código de producto.}
 procedure imprimirContenido(p: prod);
 begin
  writeln('///////////////////');
   writeln('codigo del producto', p.cod);
   writeln('cantUnidadesVendadias',p.cantTotUnid);
   writeln('total', p.montoTot:2:01);
 end;
 procedure imprimirArbolOrdenado (a: arbol);
 begin
   if (a<> nil) then begin
     imprimirArbolOrdenado(a^.hi);
     imprimirContenido(a^.dato);
     imprimirArbolOrdenado(a^.hd);
   end;
 end;
 { c. Retornar el menor código de producto.}

  function codMenor (a: arbol): integer;
  begin
    if (a = nil) 
    then codMenor:= -1 //no existe
    else if (a^.hi = nil) then codMenor:= a^.dato.cod //si es el ultimo, asigno
                          else codMenor:= codMenor (a^.hi) //sino recorro hasta el ultimo
  end;
   
   { d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
 que se recibe como parámetro.}

 function cantMenorA(a: arbol; x: integer): integer; //bien
var cont: integer;
 begin
  if (a=nil)then //si el arbol esta vacio entonces cont=0 ¿, corta y la funcion devuelve 0 
    cont:=0
  else  begin //sino 
    if (a^.dato.cod < x) then //veo que lado me conviene
	cont:= 1 + cantMenorA(a^.hi, x) + cantMenorA(a^.hd, x)
	else 
		cont:= cantMenorA(a^.hi, x)
	end;
	cantMenorA:= cont;
   end; 
   {if (a <>nil) then begin
	if(a^.dato.cod< x) then
		cantMenorA:= 1 + cantMenorA(a^.hd, x) + cantMenorA(a^.hi, x)
   end
   else
     cantMenorA:=0;
end;}
	{if (a= nil) then
	  cant:=0
	else begin
	if (a^.dato.cod < x) then
	  cant:= cant+1;
	if (x >a^.dato.cod) then
	  cant:= cantMenorA(a^.hd, x)
	  else 
	    cant:= cantMenorA(a^.hi, x)
	  end;
	cantMenorA:= cant;
end;}
	{ cant:=0;
	 if (a^.dato.cod < x) then begin
	  cant:= cant + 1;
	 if (x > a^.dato.cod ) and (a^.hd<>nil) then // ve a que rama va
	    cant:= cant+ cantMenorA(a^.hd, x)
	  else if (x < a^.dato.cod)and (a^.hd<>nil)  then
	    cant:= cant +cantMenorA(a^.hi, x)
	  end
	  else 
	    cant:= 0;
	cantMenorA:= cant;
 end;}
 
 function montoTotalEntre(a: arbol; x, y: integer): real;
var
  cant: real;
begin
  if (a= nil) then
    cant:=0
    else begin
    
	if (a^.dato.cod > x) and (a^.dato.cod<y)then begin
	writeln('cumple', a^.dato.cod) ;
    cant:= cant + a^.dato.montoTot + montoTotalEntre(a^.hi, x, y) + montoTotalEntre(a^.hd, x, y)
    end
    else if (a^.dato.cod<x) then //es asi o es menor o = ? 
      cant:= cant + montoTotalEntre(a^.hd, x, y)
	else if (a^.dato.cod>y ) then
      cant:=cant +  montoTotalEntre(a^.hi, x, y)
	end;
  montoTotalEntre:= cant ; 
end;
{  if (a= nil) then
    cant:=0
    else begin
	if (a^.dato.cod > x) and (a^.dato.cod<y)then 
    cant:= cant + a^.dato.montoTot + montoTotalEntre(a^.hi, x, y) + montoTotalEntre(a^.hd, x, y)
    else if (a^.dato.cod<x) then
      cant:= cant + a^.dato.montoTot +  montoTotalEntre(a^.hd, x, y)
	else if (a^.dato.cod<y ) then
      cant:= cant + a^.dato.montoTot + montoTotalEntre(a^.hi, x, y)
	end;
  montoTotalEntre:= cant ; 
end;}
  {if (a= nil) then 
    cant:=0
    else 
  if (a^.dato.cod > x) or (a^.dato.cod<y)then 
    cant:= cant + a^.dato.montoTot + montoTotalEntre(a^.hi, x, y) + montoTotalEntre(a^.hd, x, y);
  montoTotalEntre:= cant;
end;}
VAR
a: arbol;
x, y : integer;
BEGIN
 a:=nil;
 cargarA(a);
 imprimirArbolOrdenado(a);
 writeln('el codigo menor es: ', CodMenor(a));
 writeln('leer n para buscar productos menores a tal');
 readln(x);
  writeln('la cantidd de productos menores a ', x, 'es de',cantMenorA(a, x));
 writeln('leer valor x'); readln(x);
 writeln('leer valor y'); readln(y);
 writeln('el monto total entre los rangos ', x,'y', y, 'es de',montoTotalEntre(a, x, y):2:0);
END.

