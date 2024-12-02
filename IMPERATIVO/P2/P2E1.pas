{
 1.- Implementar un programa que invoque a los siguientes módulos.
 a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
 almacene en un vector con dimensión física igual a 10 y retorne el vector.
 b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
 c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
 d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
 retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
 e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
 retorne una lista con los caracteres leídos.
 f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
 mismo orden que están almacenados.
 g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
 la lista en orden inverso al que están almacenados.

}


program untitled;
type 
  v = array [1..10] of char;
procedure imprimir (ve: v; dl: integer);
var i: integer;
begin
  for i:= 1 to dl do
    writeln(ve[i]);
end;
procedure Cargar(var ve: v; var i: integer);
var
  c: char;
  begin
   writeln('leer caracter'); readln(c);
   if (c<> '.') and (i<10)then begin 
     i:= i+1;
     ve[i]:= c;
     Cargar(ve, i);
   end;
 end;
 procedure CargarA(var ve: v; var i: integer);
var
  c: char;
  begin
     i:= i+1;
   writeln('leer caracter'); readln(c);
     ve[i]:= c;
   if (c<> '.') and (i<10)then begin 
     CargarA(ve, i);
   end;
 end;
procedure imprimirVecRecursivo(ve: v; dl: integer; pos: integer);
begin
  if pos<dl then begin
    pos:= pos + 1;
    writeln(ve[pos]);
    imprimirVecRecursivo(ve, dl, pos);
  end;
end;
procedure imprimirVR2 (ve: v;dl: integer);
begin
  if dl> 0 then begin
    imprimirVR2(ve, dl-1);
    writeln(ve[dl]);
end;
end;
var dl,i: integer; ve: v;
BEGIN
  dl:= 0;
  i:=0;
	Cargar(ve, dl);
	writeln('la dimension es', dl);
	imprimir(ve,dl);
	writeln('........................');
	
	imprimirVecRecursivo(ve, dl,i);
	writeln('........................');
	imprimirVR2(ve, dl);
END.

