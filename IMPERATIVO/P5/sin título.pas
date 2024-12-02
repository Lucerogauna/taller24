{
3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide
* ) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
   
}


program untitled;
type
	productoArbol= record
		cod: integer;
		stock: integer;
		precioU: real;
	end;
	rango = 1.10;
	producto = record
		rubro: rango;
		info: productoArbol;
		end;
	arbol = ^nodo;
	nodo= record
		dato: productoArbol;
		hi, hd: arbol;
		end;
	Vector = array [rubro] of arbol;
procedure leerP(var p: producto);
begin
writeln('leer codigo '); readln(p.info.cod);
	if (p.info.cod <> 0) then begin
	writeln('leer rubro '); readln(p.rubro);
	writeln('leer precio unitario '); readln(p.info.precioU);
	writeln('leer stock '); readln(p.info.stock);
	end;
end;
procedure inicializarVectorArbol(var v:Vector); // esta bien????????????
var i: integer;
begin
	for i:= 1 to 10 do begin
	v[i]:= nil;
	end;
end;
procedure agregarArbol(a: arbol; datos: productoArbol);
begin
	if (a= nil) then begin
		new (a);
		a^.dato:= datos;
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin
		if (a^.dato.cod > datos.cod) then
			agregarArbol(a^.hi, datos)
		else 
			agregarArbol(a^.hd, datos) // los repetidos van a a derecha (no aclara pero lo tome asi);
	end;
end;
begin
end;
procedure cargarV (var v: Vector);
var p: producto;
begin
	leerP(p);
	while (p.info.cod <> 0) do begin
		v[p.info.rubro]:= agregarArbol (v[p.info.rubro], p.info); //le mando el arbol correspondiente al vector de rubros y la info a agregar al arbol
		leerP (p);
	end;
end;
{b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.}
function incisoB(v: Vector; rubroX: rango; codX: integer): boolean;
var
  ok: boolean;
  begin
	if (v[codx]= nil ) then
		ok:= false
	else begin
		if (v[codX]^.dato.cod > codX) then
			incisoB(v[codX]^.hi, rubroX, codX);
		if (v[codx]^.dato.cod = codX) then
			ok:= true;
		if not ok then
			incisoB(v[codX]^.hd, rubroX, codX);
  end;
  incisoB:= ok;
 end;
BEGIN
	
	
END.

