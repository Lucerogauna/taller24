{
 3.- Implementar un programa que invoque a los siguientes módulos.
 a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
 y menores a 1550 (incluidos ambos)
 *  b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
 en la práctica anterior)
 c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
 encabezado:

 Nota: El parámetro “pos” debe retornar la posición del dato o-1 si el dato no se encuentra
 en el vector}


program untitled;

type vector = array [1..20] of integer;
procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= 300 + random (1550 - 300 + 1);
    if  (dimL < 20) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end; 
Procedure busquedaDicotomica (v: vector; ini,ult: integer; dato:integer; var pos: integer);
//retorna la pos del vector o -1 si no se encuentra en el vector
// caso base? que no encuente 
var
  medio: integer;
begin
   if (ini<= ult) then begin
	medio:= (ini + ult) div 2;
    if (dato = v[medio]) then 
      pos:= medio
      else
     if (dato < v[medio]) then  begin
       ult:= medio -1;
       busquedaDicotomica(v, ini, ult, dato, pos)
       end
     else begin
       ini:= medio + 1;
       busquedaDicotomica(v, ini, ult, dato, pos)
       end
     end
   else 
     pos:= -1;
end;
{----------------------}

procedure ordenarSeleccion(var v: vector; dl: integer);
var
 j, i, item, pos: integer;
begin
  for i:= 1 to (dl - 1) do begin
    pos:= i;
    for j:= i+1 to dl do 
      if (v[j]< v[pos]) then 
        pos:= j;
      item:=v[pos];
      v[pos]:= v[i];
      v[i]:= item;
    
end;
end;
procedure agregar(var v: vector; var dl: integer);
var n: integer;
begin
  n:= 1;
  dl:= dl+1;
  v[dl]:= n;
end;
procedure imprimir (v: vector; dl: integer);
var i: integer;
begin
  for i:= 1 to dl do 
  writeln(v[i]);
end;
var 
v: vector; 
dl, ini,x,p: integer;
BEGIN
	CargarVector(v,dl);
	imprimir(v, dl);
	writeln('..............');
	ordenarSeleccion(v, dl);
	//agregar(v, dl); // para probar la busqueda dic
	imprimir(v, dl);
	writeln('leer numero a buscar');
	read(x);
	ini:= 1;
	busquedaDicotomica(v, ini, dl, x, p); //busca el valor 15, pos retorna la del dato si se encuenta
	writeln('la pos del numero x es ',p);
END.

