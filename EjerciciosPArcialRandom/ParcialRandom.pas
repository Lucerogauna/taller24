{parcial . preguntar estructura e inciso c

﻿
El hipermercado Carrefour necesita un sistema para obtener estadísticas sobre las compras realizadas por sus clientes. 
* a) Implementar un módulo que lea información de todas las compras de 2023, los almacene y retorne una estructura
de datos eficiente para la búsqueda por código de cliente donde para cada código de cliente se almacenen juntas todas sus compras.
*  De cada compra se conoce: código de cliente, número de factura, cantidad de productos y monto. La lectura finaliza con el código de cliente 0.
b) Implementar un módulo que reciba la estructura generada en a), un código de cliente y retorne la cantidad de compras 
* y el monto total gastado por dicho cliente durante el 2023.
c) Realizar un módulo que reciba la estructura generada en a) y dos números de factura X e Y, y retorne todas las ventas 
* cuyo número de factura estén entre X e Y (incluidos).
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. En caso de ser necesario, puede utilizar los módulos que se encuentran a continuación.}


program untitled;

type
	infoCompras= record
		nroFactura: integer;
		cantProducto: integer;
		monto: real;
	end;
	lista = ^nodo;
	nodo= record
		dato: infoCompras;
		sig: lista; 
		end;
	cliente= record
		cod: integer;
		compras: lista;
		end;
		clienteAleer= record
			cod: integer;
			info: infoCompras;
			end;
		arbol = ^nod;
		nod= record
			dato: cliente;
			hi, hd: arbol;
			end;
		listaNueva= ^no;
		no= record
		dato: infoCompras;
		sig: listaNueva;
		end;
procedure leerC (var c: clienteAleer);
begin
	writeln('leer cod'); readln(c.cod);
	if c.cod <> 0 then begin
	writeln('leer nro Factura'); readln(c.info.nroFactura);
	writeln('leer cant de productos'); readln(c.info.cantProducto);
	writeln('leer monto'); readln(c.info.monto);
end;
end;
procedure agregarLista(var l:lista; dat: infoCompras);
var nue: lista;
begin
	new (nue);
	nue^.dato:= dat;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregarA (var a: arbol; c: clienteAleer);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.compras:= nil;
		agregarLista(a^.dato.compras, c.info);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if (a^.dato.cod = c.cod) then
			agregarLista(a^.dato.compras, c.info)
		else if (a^.dato.cod > c.cod) then
			agregarA(a^.hi, c)
		else
			agregarA(a^.hd, c);
		end;
end;
procedure cargarA(var a: arbol);
var 
 c: clienteAleer;
 begin
	leerC(c);
	while (c.cod <> 0 )  do begin
		agregarA (a, c);
		leerC(c);
	end;
 end;
 {b) Implementar un módulo que reciba la estructura generada en a), un código de cliente y retorne la cantidad de compras 
* y el monto total gastado por dicho cliente durante el 2023.}
procedure calcularEnLista (l: lista; var cant: integer; var monto: real);
begin
	cant:=0;
	monto:= 0;
	while l<> nil do begin
		cant:= cant+1;
		monto:= monto+ l^.dato.monto;
		l:= l^.sig;
	end;
end;
procedure IncisoB (a:arbol; codX: integer; var cantCompras: integer; var montoTotal: real);
begin
	if (a= nil) then begin
		cantCompras:= 0;
		montoTotal:= 0
	end
	else begin
		if (a^.dato.cod = codX) then 
			calcularEnLista (a^.dato.compras, cantCompras, montoTotal) //le mando la lista y devuleve la cant de compras y montoTotal
		else if  (a^.dato.cod >codX) then
			IncisoB(a^.hi,codX, cantCompras, montoTotal) 
		else 	IncisoB(a^.hd, codX, cantCompras, montoTotal) 
	end;
end;
{c) Realizar un módulo que reciba la estructura generada en a) y dos números de factura X e Y, y retorne todas las ventas 
* cuyo número de factura estén entre X e Y (incluidos).}
procedure agregarANueva(l: listaNueva; dat: infoCompras);
var nue: listaNueva;
begin
	new (nue);
	nue^.dato:= dat;
	nue^.sig:= l;
	l:= nue;
end;

procedure desmenuzoLista (l: lista; n1, n2: integer; var nl: listaNueva);
begin
	while (l<> nil) do begin
		if (n1 >= l^.dato.nroFactura) and (n2<= l^.dato.nroFactura) then // cada estructura debe recorrer de forma efociente para arbol recursion,, para lista whila
			agregarANueva(nl, l^.dato);
		l:= l^.sig
	end;
end;
procedure incisoC (a: arbol; nroX, nroY: integer; var nl: listaNueva);
begin
	if (a<> nil) then begin
		incisoC(a^.hi, nroX, nroY, nl);
		desmenuzoLista(a^.dato.compras, nroX, nroY, nl);
		incisoC(a^.hd, nroX, nroY, nl);
	end;
end;
 var
	a: arbol;
BEGIN
	a:= nil;
	cargarA(a);
	
END.

