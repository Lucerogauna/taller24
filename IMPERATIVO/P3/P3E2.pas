{ 2. Escribir un programa que:
 a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
 Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. 
 * Finalizar con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
 i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
 producto. Los códigos repetidos van a la derecha.
 ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
 código de producto. Cada nodo del árbol debe contener el código de producto y la
 cantidad total de unidades vendidas.
 iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
 código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
 las ventas realizadas del producto.
 Nota: El módulo debe retornar TRES árboles.
 b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
 total de productos vendidos en la fecha recibida.
 *  c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
 con mayor cantidad total de unidades vendidas.
 d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
 con mayor cantidad de ventas.}
program p3e2;
type
venta= record
  cod: integer;
  fech: integer; //???????????????
  cantU:integer;
  end;
  arbol=^nodo;
  nodo= record
  dato: venta;
  hi: arbol;
  hd: arbol;
  end;
vent2= record
  cod2: integer;
  cantTot:integer;
  end;
  arbol2=^nodo2;
  nodo2= record
  dato2: vent2;
  hi: arbol2;
  hd: arbol2;
  end;
venta_estruraiii= record
  fecha: integer;
  cant: integer;
  end; 
 lista =^nodoL;
nodoL= record
 dato: venta_estruraiii;
 sig: lista;
 end;
 vent3= record
 cod: integer;
 info3: lista;
 end;
  arbol3=^nodo3;
  nodo3= record
  dato3: vent3;
  hi,hd: arbol3;
  end;
procedure leerV(var v: venta);
begin
writeln('codigo');v.cod:= random(50); //read(v.cod);
if v.cod <> 0 then begin
writeln('dia'); v.fech:= random(100);
writeln('cant unidades vendidas');v.cantU:= random(20); //read(v.cantU);
end;
end;
procedure agregarA(var a : arbol; v: venta);
begin
  if (a=nil) then begin
    new(a);
    a^.dato:= v;
    a^.hi:= nil; 
    a^.hd:=nil;
    end
  else 
    if (a^.dato.cod > v.cod) then
      agregarA(a^.hi, v)
     else 
      agregarA(a^.hd, v);
end;
procedure agregarA2(var a : arbol2; v: venta);
begin
  if (a=nil) then  begin
    new(a);
    a^.dato2.cod2:= v.cod;
    a^.dato2.cantTot:= v.cantU;
    a^.hi:= nil; a^.hd:=nil;
    end
  else 
    if (a^.dato2.cod2 = v.cod) then
      a^.dato2.cantTot:= a^.dato2.cantTot + v.cantU
    else if (a^.dato2.cod2 > v.cod) then
      agregarA2(a^.hi, v)
     else 
      agregarA2(a^.hd, v);
end;
procedure agregarADLista (var l: lista; can, fe: integer);
var
nue: lista;
begin
  new (nue);
  nue^.dato.cant:= can; 
  nue^.dato.fecha:= fe;
  nue^.sig:= l;
  l:= nue;
end;
procedure agregarA3(var a3: arbol3; v: venta);
begin
  if a3= nil then begin
    a3^.dato3.cod:= v.cod;
    agregarADLista(a3^.dato3.info3, v.fech, v. cantU);
    a3^.hi:= nil;
    a3^.hd:= nil
    end
    else begin
      if (a3^.dato3.cod> v.cod) then 
        agregarA3(a3^.hi, v)
        else
        agregarA3(a3^.hd, v)
        end;
end;
procedure cargarA(var a: arbol; var a2: arbol2; var a3: arbol3);
var vent: venta;
begin
  leerV(vent);
  while vent.cod <> 0 do begin
    agregarA(a, vent);
    agregarA2(a2, vent);
    agregarA3(a3, vent);
    leerV(vent);
  end;
end;
{ b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
 total de productos vendidos en la fecha recibida.}
function fecha (a: arbol; fechABuscar: integer): integer;
var ok: integer;
begin
  if (a= nil) then
    ok:= 0
  else if (a^.dato.fech = fechABuscar) then 
    ok:= ok + a^.dato.cantU;
  ok:= fecha(a^.hi, fechAbuscar);
  ok:= fecha(a^.hd, fechAbuscar);
  fecha:=ok;
end;
 
{c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
 con mayor cantidad total de unidades vendidas.}
 function codMaxVentas(a:arbol2): integer;
 var 
 max, maxC: integer;
 begin
  if (a=nil) then
    max:= -1
  else begin
    max:= codMaxVentas(a^.hi); //llama primero por la izq, cuando termina compara 
    if(a^.dato2.cantTot > max) then begin//hace esto
      max:= a^.dato2.cantTot;
      maxC:=a^.dato2.cod2;
      end;
    max:= codMaxVentas(a^.hd); //va por la izq
 end;
 codMaxVentas:= maxC;
 end;
 function recorrerL(l: lista): integer;
 var cant: integer;
 begin
   cant:= 0;
   while l <> nil do begin
     cant:= cant+1;
     l:= l^.sig;
   end;
   recorrerL:=cant;
 end;
 {d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
 con mayor cantidad de ventas.}
function CodMaxVentas(a: arbol3): integer;
var maxV, cod: integer;
begin
  if a = nil then begin
    cod:= -1;
    maxV:= -1;
    end
  else begin
    CodMaxVentas(a^.hi);
    if (recorrerL(a^.dato3.info3)) > maxV then begin
      maxV:= recorrerL(a^.dato3.info3) ;
      cod:= a^.dato3.cod;
      end;
    CodMaxVentas(a^.hi);
  end;
    CodMaxVentas:= cod;
end;
BEGIN
	
	
END.

