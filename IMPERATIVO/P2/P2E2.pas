{
 2.- Escribir un programa que:
 a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
 “random” en el rango 100-200. Finalizar con el número 100.
 b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
 mismo orden que están almacenados.
 c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
 la lista en orden inverso al que están almacenados.
 d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
 valor de la lista.
 e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
 verdadero si dicho valor se encuentra en la lista o falso en caso contrario
   
}

program P2E2;
type
  lista= ^nodo;
  nodo= record
    n: integer;
    sig: lista;
  end;
procedure agregarAD(var L: lista; num: integer);
var nue: lista;
begin
  new(nue);
  nue^.n:= num;
  nue^.sig:= L;
  L:= nue;
end;
procedure cargarListaRecursiva (var l:lista);
var 
  n: integer; 
begin
  n:= 100 + random (200-100+1);
  if (n <>100) then begin
    agregarAD(L, n);
    cargarListaRecursiva(l);
  end;
end;
procedure imprimir (l: lista);
begin
  while l<> nil do begin
  writeln('el numero es');
  writeln(l^.n);
  l:= l^.sig;
end;
end;
procedure imprimir2(l: lista);
begin
  if l<> nil then begin
  writeln('el numero es');
  writeln(l^.n);
  imprimir2(l^.sig);
end;
end;
procedure imprimirRInverso (l: lista);
begin
  if l<> nil then begin
  imprimirRInverso(l^.sig);
  writeln('el numero es');
  writeln(l^.n);
end;
end;
procedure calcularMin (l: lista;  var min: integer); /// anda. igual consultar
begin
  if l<> nil then begin
  calcularMin(l^.sig, min);
  if l^.n < min then
    min:= l^.n;
end;
end;
function esta (l: lista; numA:  integer): boolean; // anda. consultar igual
var ok: boolean;
begin
  ok:= false;
  if (l<> nil) and (numA>10) and (numA<20) and not(ok) then begin
    if (l^.n = numA) then begin
       ok:= true
       end
     else ok := esta(l^.sig, numA); //por que no esta:= esta ())=?''''''''
  end;
  esta:= ok;
end;

function esta2 (l: lista; numA:  integer): boolean; // anda. consultar igual
begin
  if (l<> nil) and (numA>10) and (numA<20) then begin
    if (l^.n = numA) then 
       esta2:= true
     else
       esta2 := esta2(l^.sig, numA); //acordarse de los 2 casos // ir savando el valor de la funcion
  end
  else 
    esta2:= false;
end;

VAR
l: lista; minimo: integer;
ok, incisoG: boolean;
BEGIN
 randomize;
 l:= nil;
 cargarListaRecursiva(l);
 imprimir(l);
  writeln('-----------');
 imprimir2(l);
  writeln('-----------');
 imprimirRInverso(l);
 minimo:= 999;
 calcularMin(l, minimo);
 writeln('el minimo leido es de ',minimo);
 ok:= false;
 incisoG:= esta2(l, 30);
 writeln('el numero minimo ',incisoG);
END.

