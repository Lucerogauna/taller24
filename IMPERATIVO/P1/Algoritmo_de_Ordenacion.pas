{
ALGORITMO DE ORDENACION
* logica me posiciono a partir del segundo y comparo los anteriores, si v[] es mas chico,
*  realizo el corrimiento con todos los anteriores
* 1ra vuelta se trabaja con el primero, se considera que esta ord
* Por cada elemento del arreglo busco en que pos deberia insertarse
   
}


program ordenacion;
type
  Vector = array [1..100] of integer;
procedure  ordenacion (var v: Vector; dl: integer);
begin
  for i:= 2 to dl do begin  // desde la posicion 2 hasta el final del arreglo
    actual:= v[i];  //tomo el elemento i
    j:= i-1;
    while j>0 and v[j]>actual do begin
      v[j+1]:= v[j];  //hago el corrimiento 
      j:= j-1; //decremento 
    end;//repito el while hasta j=0
    v[j+1]:= actual;  // agrego el elemento en la posicion
  end;  
end;

BEGIN
	
	
END.

