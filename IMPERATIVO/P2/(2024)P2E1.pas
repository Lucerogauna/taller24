{
* Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random”
mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del
vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector. 
d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores
pares contenidos en el vector.
e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del
vector.
f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si
dicho valor se encuentra en el vector o falso en caso contrario.
g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en
el vector, sus dígitos en el orden en que aparecen en el número. Debe implementarse un
módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se
debe imprimir 1 4 2.}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
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
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
     if dimL > 0 then begin
     ImprimirVectorRecursivo(v, dimL-1);
     writeln(v[dimL]); //imprime en orden a como esta el vector
     end;
end; 
    function esPar(n: integer): boolean;
begin
  esPar:= (n mod 2)=0;
end;

function sumaMio (v: vector; dimL: integer): integer; // ????????????????????????????????????????????????????consultar
begin
   if dimL>0 then begin
     if esPar(v[dimL]) then 
       sumaMio:= sumaMio(v, dimL-1) + v[dimL];
   end;
end;


function EsMenor(n: integer; m: integer):boolean;
begin
  EsMenor:= n>max;
end;
function incisoEMAX (v: vector; dimL: integer; max: integer ): integer;
begin
  if dimL>0 then begin
    incisoEMAX (v, dimL-1, max);
    if EsMenor([dimL], max) then
      max:= v[dimL];
  end;
  incisoEMAX:=max;
end; 
{---------------------------------}
function incisoFBuscar(v: integer; dl: integer; numBuscar: integer; ok: boolean): boolean; //en ppal se asigna ok como fals primero
//tengo que usar variable aux y despues asignarsela a la function??
begin
  if (dl > 0 ) and (numBuscar>10 and numBuscar<155)and not(ok)then begin //consultar el orden de esto, como se que esta bien
     if v[dl] = numBuscar then
       ok:=  true; ;
     incisoFBuscar:= incisoFBuscar(v, dl-1, numBuscar, ok);
end;
end;
{-----------------------------------------}


procedure imprimirR(num: integer);//anda bien
begin
  if num> 0 then begin 
    imprimirR(num div 10); //esta bien asi o tengo que hacer una variabble aux?
    writeln(num mod 10);
end;
end;
procedure incisoG(v:  vector; dl: integer);
var i: integer;
begin
  for i := 1 to dl do begin
    imprimirR(v[i]);
  end;
end;
{-----------------------------------}

var dimL, suma, maximo, valor, pos: integer; 
    v: vector;
    encontre: boolean;
Begin 
  Randomize;
  CargarVector (v, dimL);
  writeln;
  writeln('dimension del vector es de: ',dimL);
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                       writeln('......');
                       ImprimirVectorRecursivo (v, dimL);
                       pos:=0;
                       suma:=sumaMio(v,dimL);
  writeln('la suma de los numeros pares es de ',suma); //MAL!!!!!!!

                     end;
 
	
END.

