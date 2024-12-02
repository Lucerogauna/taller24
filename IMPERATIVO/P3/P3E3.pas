{
   3. Implementar un programa que contenga:
 a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
 Informática y los almacene en una estructura de datos.
 *  La información que se lee es legajo,
 código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
 generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
 guardarse los finales que rindió en una lista.
 b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.
 c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
 su cantidad de finales aprobados (nota mayor o igual a 4).
 c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
   cuando inicalizo la lista en nil??
   * esta bien la Estructura? muchos registrols?
}
program untitled;
type
  info= record
    leg: integer;
    codMateria: integer;
    fecha: integer;
    nota: integer;
    end;
  finales = record
    codM: integer;
    fech: integer;
    nota: integer;
  end;
  lista = ^nodl;
    nodl= record
    dat1: finales; 
    sig: lista;
  end;
  EArbol= record
    leg: integer;
    fin: lista;
  end;
 arbol=^nodo;
 nodo= record
 dato: EArbol;
 hi, hd:arbol;
 end;
 ne= record
   leg: integer;
   prom: real;
   end;
   listaNE= ^nod;
   nod= record
     dato: ne;
     sig: listaNE;
     end;
 procedure leer(var i: info);
begin
writeln('legajo');read(i.leg); //read(v.cod);
if i.codMateria <> 0 then begin
writeln('codigo');read(i.codMateria); //read(v.cod);
writeln('dia');i.fecha:= random(100);
writeln('nota');i.nota:= random(10); //read(v.cantU);
end;
end;
procedure agregarADLista (var l: lista; i: info);
var 
  nue: lista;
 begin
   new(nue);
   nue^.dat1.codM:= i.codMateria;
   nue^.dat1.fech:= i.fecha;
   nue^.dat1.nota:= i.nota;
   nue^.sig:=l;
   l:= nue;
   
  end;
procedure agregarArbol (var a: arbol; i: info);
begin
  if (a= nil) then begin
   new(a);
   a^.dato.leg:= i.leg;
   a^.dato.fin:= nil;//inicializoo lista siempre!
   agregarADLista(a^.dato.fin, i); //
   a^.hi:= nil; a^.hd:= nil;
  end
  else begin
    if(a^.dato.leg= i.leg) then 
      agregarADLista(a^.dato.fin, i)
    else if (a^.dato.leg > i.leg) then
      agregarArbol(a^.hi, i)
      else 
      agregarArbol(a^.hd, i)
    end;
end;
procedure cargar(var a: arbol);
var
  i: info;
begin
  leer(i);
  while i.leg <>0 do begin
    agregarArbol(a, i);
    leer(i);
end;
end;
{b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.}
 function cantImpar(a: arbol): integer;
 var 
   cant: integer;
 begin
   if (a= nil) then 
     cant:=0
   else begin
     cant:= cantImpar(a^.hi);
     if (not(a^.dato.leg mod 2)=0) then
       cant:= cant + 1;
     cant:= cantImpar(a^.hd);
   end;
   cantImpar:=cant;
 end;
 { c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
 su cantidad de finales aprobados (nota mayor o igual a 4).}
 
 function calcularCantDeFinalesAprobados(l: lista): integer;
 var aux: integer;
 begin
   aux:=0;
   while l<>nil do begin
     if l^.dat1.nota >= 4 then
       aux:= aux+1;
     l:= l^.sig;
   end;
  calcularCantDeFinalesAprobados:= aux;
 end;
 procedure incisoC(a: arbol);
 begin
   if a= nil then
     writeln('no hay nada en el arbol')
    else begin
      incisoC(a^.hi);
      writeln('legajo nro', a^.dato.leg, 'cant de finales aprobados:', calcularCantDeFinalesAprobados(a^.dato.fin));
      incisoC(a^.hi);
    end;
 end;
 {c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.} 
 function calcularProm(l: lista): real;
 var aux: real; cantF: integer;
 begin
   aux:= 0; cantF:=0;
   while l<> nil do begin
     cantF:=cantF +1;
     aux:=aux + l^.dat1.nota;
     l:= l^.sig;
   end;
    calcularProm:= aux/cantF;
 end;
 procedure agregarNuevaLista(var l: listaNE; le: integer; pro: real);
 var 
   nue: listaNE;
  begin
    new (nue);
    nue^.dato.leg:= le;
    nue^.dato.prom:= pro;
    nue^.sig:= l;
    l:= nue;
  end;
 procedure NEstructura(a: arbol;n: real; var l: listaNE);
 begin
   if a = nil then
     writeln('dkw')
     else begin
       NEstructura(a^.hi,n , l);
       if ((calcularProm(a^.dato.fin))> n) then 
         agregarNuevaLista(l, a^.dato.leg, calcularProm(a^.dato.fin));
         NEstructura(a^.hd,n , l);
     end;
 end;

var a: arbol; ln: listaNE; x: real;
begin
  a:=nil; //siempre
  cargar(a);
  writeln('cantt de alumnos con legajo impar', cantImpar(a));
  incisoC(a);
 writeln('leer valor a comparar'); readln(x);
  NEstructura(a, x, ln);
end.
