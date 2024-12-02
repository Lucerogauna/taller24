
program programaVectores;
type
vector= array [1..50] of integer;
  procedure CargarV(var v: vector;var pos: integer);
  var
  n: integer;
begin
  writeln('leer un valor');readln(n);
   while n<>0 do begin
    pos:= pos +1;
    v[pos]:= n;
     writeln('leer un valor');readln(n);
end;
  end;
procedure eliminarRango (var v: vector ;var dl: integer;  n1: integer; n2: integer);  
var i: integer;
  begin
    if (n1>v[1]) and (n2<v[dl]) then begin
      i:= 1;
      while i< dl do begin
        if v[i] < n1 then
          i:= i +1
        else begin
          for i:=i to dl-1 do 
            v[i]:= v[i]+1;
          dl:= dl-1;
        end;
    end;
  end;
  end;
procedure Imprimir (v: vector; p: integer);
var i: integer;
begin
  for i:= 1 to p do 
    writeln(v[i]);
end;
procedure Eliminar (var v: vector; var dimL: integer; valorInferior: integer; valorSuperior: integer);

  function BuscarPosicion (v: vector; dimL: integer; elemABuscar: integer): integer;
  var pos: integer;
  begin
    pos:= 1;
    while (pos <= dimL) and (elemABuscar > v[pos]) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicion:= 0
                    else BuscarPosicion:= pos;
  end;
  
  function BuscarPosicionDesde (v: vector; dimL, pos : integer; elemABuscar: integer): integer;
  begin
    while (pos <= dimL) and (elemABuscar >= v[pos]) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicionDesde:= dimL
                    else BuscarPosicionDesde:= pos - 1;
  end;
  procedure Corrimiento (var v: vector; var dl: integer; posMin: integer; posSup: integer);
var d, i: integer;
begin
     d:= posSup - posMin + 1; //d son la cant de posiciones a eliminar de Pos min a Pos max
    for i:= posSup + 1 to  dl do begin
      v[i- d]:= v[i];
    end;
    dl:= dl - d;
end;
{MAL procedure Corrimiento (var v: vector; var dl: integer; posI: integer; posII: integer);
var i: integer;
begin
  while posII<>posI do begin
    for i:= posI to (posII) do begin
      v[posI]:= v[posII+1]
    end;
   { for i:=posI to posII do begin
      v[posII]:= v[posII+1];
    end;}
end}
    dl:= dl - (posII-posI);
end;
var posInferior, posSuperior, salto, i: integer; 
Begin
  posInferior:= BuscarPosicion (v, dimL, valorInferior); //busca la posision (si existe )  donde esta el elemAbuscar
  if (posInferior <> 0) then begin  //si existe entra al if y busca la posicion superior 
         posSuperior:= BuscarPosicionDesde (v, dimL, posInferior, valorSuperior);
         if (PosSuperior <> 0) then 
           Corrimiento (v, dimL, posInferior,posSuperior);
       end;
end;
var
  mi,pos, ma: integer; 
  vc: vector;
BEGIN
  pos:=0;
  CargarV(vc,pos);
  Imprimir (vc, pos);
  
  writeln('leer un valor min');readln(mi);
  
  writeln('leer un valor max');readln(ma);
  //eliminarRango(vc, pos, mi, ma);
  
Eliminar(vc, pos, 3, 6);
  Imprimir (vc, pos);
END.

