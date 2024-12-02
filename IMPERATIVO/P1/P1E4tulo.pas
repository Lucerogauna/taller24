{
   4.- Una librería requiere el procesamiento de la información de sus productos. De cada
 producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
 Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
 a. Lea los datos de los productos y los almacene ordenados por código de producto y
 agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
 cuando se lee el precio 0.
 b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
 c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
 puede haber más omenosde30productos del rubro 3. Si la cantidad de productos del rubro 3
 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
 d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
 métodos vistos en la teoría.
 e. Muestre los precios del vector resultante del punto d).
 f. Calcule el promedio de los precios del vector resultante del punto d)
   
  * el promedio lo puedo generar al cargar vector? o recorro? 
}


program P1E4;
type
  produc= record
  codP: integer;
  codR: 1..8;
  precio: real;
  end;
 lista = ^nodo;
 nodo= record
   dato: produc;
   sig: lista;
   end;
  produc3= record
    codP: integer;
    precio: real;
   end;
  nuevec= array [1..30] of produc3;
 vecL= array [1..8] of lista;
   procedure leer (var p: produc ); // registro 
  begin
    with p do begin
    writeln('codP');
    readln(codP);
    if codP <> -1 then begin
    writeln('codR');
    readln(codR);
    writeln('precio');
    readln(precio);
    end;
  end;
  end;
procedure InsertarOr(var l: lista; p: produc);
var act,nue, ant: lista;
begin 
  new (nue);
  nue^.dato:= p;
  act:= l; ant:= l;
  while (act <> nil) and (act^.dato.codP< p.codP) do begin
    ant:= act;
    act:= act^.sig;
    end;
    if act= ant then
      l:= nue// no act= l!!!!!!!
    else 
      ant^.sig:= nue;
      nue^.sig:= act;
  end;
procedure cargarvl(var vl: vecL);
var pro: produc;
  begin
     leer(pro);
     while (pro.codP <> -1 )do begin
       InsertarOr(vl[pro.codR], pro);
       leer(pro);       
     end;
  end;
  procedure imprimir(vector: vecL);
  var i: integer;
  begin
  for i:= 1 to 8 do begin
    if vector[i]<>nil then begin
    writeln('---Lista en la posicin :', i,'---');
    while (vector[i] <> nil) do begin   // no entra
    writeln('codigo de producto:');
    writeln(vector[i]^.dato.codP);
    vector[i]:=vector[i]^.sig;
    end;
    writeln('---Fin de Lista en la posicin :', i,'---');
   end
     else 
    writeln('---no se cargaron elementos en la posicin :', i,'---');
  end;
  end;
Procedure VectorRubro3(v: vecL; var vecNue: nuevec; var dimvec: integer; var pro:real);
var suma: real;
begin
  suma:=0;
  dimvec:=0;
  while (v[3]<>nil) and (dimvec<30) do begin
    dimvec:= dimvec + 1;
    vecNue[dimvec].codP:=  v[3]^.dato.codP;
    vecNue[dimvec].precio:=  v[3]^.dato.precio;
    suma:=suma + v[3]^.dato.precio;
    v[3]:=v[3]^.sig;
  end;
  pro:=suma/dimvec;
end;
procedure OrdenarxPrecio (var v: nuevec; dl: integer);
var 
  i, j, pos: integer;
  item: produc3;
  begin
    for i:= 1 to dl-1 do begin
      pos:= i;
      for j:= i+1 to dl do begin
        if v[j].precio < v[pos].precio then 
          pos:= j;
        item:= v[pos];
        v[pos]:= v[i];
        v[i]:= item;
        end;
      end;
    end;
procedure imprimirNV (v: nuevec; dl: integer);  //vector 
var
   i: integer;
  begin
    for i := 1 to dl do begin
    writeln('codP',v[i].codP );
    writeln('precio',v[i].precio:2:0 )
    //obviar lo otro
    end;
  end;
procedure inicializa(var v: vecL);
var
  i: Integer;
begin
  // Inicializar el vector de listas ///??????? SI
  for i := 1 to 8 do
    v[i] := nil; 
    end;
VAR
  v: vecL;nv: nuevec; dl: integer;promedio: real;
BEGIN
    inicializa(v);
    promedio:=0;
	cargarvl(v);
	imprimir(v);
VectorRubro3(v, nv, dl, promedio);
writeln('promm',promedio);
OrdenarxPrecio(nv, dl);
	imprimirNV(nv, dl);
	
END.

