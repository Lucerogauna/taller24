{Algoritmo de selección}
{orden de n^2 (mas grande es el arreglo, + tiempo pero a su vez es mas facil de implemetar, no es uno de los mas usados)}
{consiste en buscar en c vuelta cual es el elemento mas chico
* y lo intercambio con la posicion que estoy actual
* N - 1 veces j}

program Algoritmo de seleccion;

type
  Vector = array [1..100] of integer;
 Procedure (var v: Vector; dl: integer)
 var i, j, pos, item : integer;
 BEGIN
   for i:= 1 to (dl-1) do begin
     pos:= i; //Pos actual
     for j:= i+1 to dl do //desde la posicion siguiente hasta el final
       if v[j] < v[pos] then //comparo si el numero es menor a la pos principal
         pos:= j;  //guardo en que pos esta el elemento minimo 
     {cuando sale del for j, ya tego el minimo  o reasigno el mismo valor
     *intercambio v[i] y v[pos]}
     item:= v[pos]; //guardo lo que esta guardado en la pos minima
     v[pos]:= v[i]; // guardo lo que esta en el arreglo
     v[i]:= item; //guardo lo que esta en item (el minimo)
   end;
 END;
