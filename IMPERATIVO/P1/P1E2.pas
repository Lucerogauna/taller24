{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas.  
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se 
ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza 
cuando se ingresa el código de identificación -1, el cual no se procesa. 
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina. 
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
   
}


program p1Ej2;

type
  ofi= record
    cod: integer;
    dniP: integer;
    valorE: real;
    end;
  vector = array [1..300] of ofi;
procedure leer (var o: ofi); // registro 
  begin
    with o do begin
    writeln('cod');
    readln(cod);
    if (cod <>-1) then begin
      writeln('dni prop');
      readln(dniP);
      writeln('valorExpensas');
      readln(valorE);
    end;
    end;
  end;
  procedure cargarV(var v: vector; var pos: integer);
  var ofic: ofi; 
   begin
    leer(ofic);
    pos:=0;
    while (pos <> 300) and (ofic.cod<> -1) do begin
      pos:= pos+ 1;
      v[pos]:= ofic;
      leer(ofic);
      
  end;
  end;
  procedure imprimir (v: vector; p: integer);  //vector 
var
   i: integer;
  begin
    for i := 1 to p do begin
    writeln('cd leido',v[i].cod);
    //obviar lo otro
    end;
  end;
 procedure OrdenarOrdenacion(var v: vector; dl: integer);
 var 
    i, j: integer;
    actual: ofi;
    begin 
    for i:= 2 to dl-1 do begin
       actual:= v[i];
       j:= i-1;
       while (j > 0 ) and (v[j].cod> actual.cod) do begin
         v[j + 1]:= v[j];
         j:= j-1;
       end;
    v[j+1]:= actual;
    end;
 end;
 Procedure seleccion ( var v: vector; dimLog: integer );

var i, j, pos: integer; item : ofi;	
		
begin
 for i:=1 to dimLog-1 do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to dimLog do //desde el siguiente hasta el final
             if v[ j ].cod < v[ pos ].cod then pos:=j; //si encuentro el minimo se guarda la posicion

         {intercambia v[i] y v[p]}
         item := v[ pos ]; // item = variable aux que guarda el contenido de pos  
         v[ pos ] := v[ i ];   // intercambian contenido
         v[ i ] := item;
      end;
end;

var
  v: vector; p: integer;
BEGIN
	cargarV(v, p);
	imprimir(v, p);
	OrdenarOrdenacion (v, p);
END.


















