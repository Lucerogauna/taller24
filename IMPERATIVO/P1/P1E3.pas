{Preguntar como recorro la lista dentro del vector, si esta bien
* en el ejercicio b tengo que guardar el codigo de la pelicula y a su vez el puntaje para luego hacer el c
 3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre 
de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 
3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje promedio 
otorgado por las críticas.  
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de 
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el 
código de la película -1. 
* b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje 
obtenido entre todas las críticas, a partir de la estructura generada en a).. 
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos 
métodos vistos en la teoría.  
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, 
del vector obtenido en el punto c).
}//preguntar recorrer 

program untitled;
type
  rangG= 1..8;
  peliAguardar= record
    codPeli: integer;
    puntprom: real;
    end;
    peli= record
      codG: rangG;
      datoAG: peliAGuardar;
      end;
    lista=^nodo;
    nodo= record
      dato: peliAguardar;
      sig:lista;
    end;
    punteros = record
      ult, pri: lista;
      end;
      
   VectorB= array [rangG] of real;
   VLista= array[rangG] of punteros;
   procedure InicializarB (var v: VectorB);
   var 
     i: rangG;
   begin
     for i:= 1 to 8 do 
       v[i]:=0;
   end;
procedure leerPeli(var p: peli); // registro 
  begin
    with p do begin
     writeln('cod peli');
     readln(datoAG.codPeli);
     if (datoAG.codPeli) <> -1 then begin
      writeln('codGenero');
      readln(codG);
      writeln('puntaje promedio ');
      readln(datoAG.puntprom); //pag
     end;
    end;
  end;
  procedure agregarAtras(var pri: lista;var ult: lista; a: peliAguardar);
  var nue: lista;
  begin
    new(nue);
    nue^.dato:=a;
    nue^.sig:= nil;
    if (pri = nil) then
      begin
        pri:= nue;
      end
      else begin
        ult^.sig:=nue;
   ult:= nue;
   end;
end;
procedure cargarvector(var vl: vLista);
var
  pe:peli;
begin
  leerPeli(pe);
  while(pe.datoAG.codPeli <> -1) do begin
     agregarAtras(vl[pe.datoAG.codPeli].pri, vl[pe.datoAG.codPeli].ult, pe.datoAG); //al vector en la pocicion x le guardo los datos
     leerPeli(pe);
     
   end;
  end; 
procedure  calcularmax(n: real; cod: integer; var codM: integer; var max: real);
begin 
  if n> max then begin
    max:= n;
    codM:= cod;
  end;
end;  


procedure CalcularB(vl:VLista; var vb:VectorB);
var  i,codmax: integer; max: real;
begin
  for i:= 1 to 8 do begin
  max:=-1;
    while vl[i].pri<> nil do begin //esta bien recorrer la lista asi? o tendria que usar una variable aux para no perder el punterode pri
   //de referencia codmax:= vl[i].pri^.dato.codPeli;
      calcularmax(vl[i].pri^.dato.puntprom,vl[i].pri^.dato.codPeli, codmax, max);
     vl[i].pri:= vl[i].pri^.sig; // se hace esto??? Esta accediendo bien al dato? 
    end;
    vb[i]:= codmax;
  end; 
end;

procedure inicializar (var v: vLista); //vector de punteros
var i: integer;
begin
  for i:= 1 to 8 do begin
    v[i].pri:= nil; // se obvia ult
  end;
end;
//inicializar la lista que esta en el registro que esta en el vector 
{-----------------}

BEGIN
	
	
END.

