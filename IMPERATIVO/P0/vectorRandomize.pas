{Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el cero.
   
   
}


program programaVectores;
type
vector= array [1..50] of integer;
  procedure CargarV(var v: vector; min: integer; max: integer; var pos: integer);
  var
  n: integer;
begin

  randomize;
  n:= min + random (max-min+1);
   while n<>0 do begin
    pos:= pos +1;
    v[pos]:= n;
    n:= min + random (max-min+1);
  end;
end;
procedure Imprimir (v: vector; p: integer);
var i: integer;
begin
  for i:= 1 to p do 
    writeln(v[i]);
end;
procedure ordenar (var v: vector; DL: integer);
var i, j,p, item: integer;
begin
for i:=1 to DL-1 do begin
         p := i;
         for j := i+1 to DL do
                 if v[ p ] > v[ j ] then 
                        p:=j;
         if (i <> p) then begin
                 item := v[ i ];   
                 v[ i ] := v[ p ];   
                 v[ p ] := item;
         end;
end;
end;
var
  mi,pos, ma: integer; 
  vc: vector;
BEGIN
  pos:=0;
  readln(mi);
  readln(ma);
  CargarV(vc, mi, ma, pos);
  Imprimir (vc, pos);
 // ordenar(vc, pos);
  //Imprimir (vc, pos);
END.

