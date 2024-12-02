 {Se desea procesar la información de las ventas de productos de un comercio (como máximo 50). 
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida
 (como máximo 99 unidades). El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer. El ingreso de las ventas finaliza con el día de venta 0 
 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).
ver codigo de P1E1 de eliminar entre rangos, resuelto con la profe
}

program p1e1;

type
  venta= record
    dia: integer;
    cod: 1..15;
    cantV:1..99;
    end;
  vec= array [1..50] of venta;
procedure leer(var v: venta);
begin
  with v do begin
   dia:= random(32);  writeln(dia);

  cod:= random (15);  writeln(cod);

  writeln('cantV');
  readln(cantV);
end;
end;
procedure cargar (var v: vec; var dl: integer);
var ven: venta;
begin
  leer(ven);dl:=0;
  while ven.dia<> 0 do begin
    dl:= dl+1;
    v[dl]:= ven;
    leer(ven);
  end;
end;
procedure imprimir (v: vec; dl: integer);
var i: integer;
begin
  for i:= 1 to dl do begin
    writeln(v[i].dia);writeln(v[i].cod);
  writeln(v[i].cantV)
  end;
end;
procedure eliminarRango (var v: vec;var dl: integer;  n1: integer; n2: integer);
  var  
  begin
    if v[1]> n1 and v[dl]<n2 then begin
      while i:= 1 to dl do begin
        if v[i] < n1 then
          i:= i +1
        else begin
          for i to dl-1 do 
            v[i]:= v[i]+1
          dl:= dl-1;
        end;
    end;
  end;
procedure ordenarSeleccion(var v: vec; dl: integer);
  var  
    i, j,pos: integer;
    item: ven;
  begin
    for i:= 1 to dl-1 do begin
      pos:= i;
      for j:= i+1 to dl do begin
        if v[j].cod< v[pos].cod;
        pos:= j;
      item:= v[pos].cod;
      v[pos]:= v[i];
      v[i]:= item;
     end;
    end;
  end;
VAR
  v: vec;dl: integer;
BEGIN
  randomize;
	cargar(v, dl);
	ordenarSeleccion(v,dl);
	imprimir(v, dl);
	
END.



