{
   ESTRUCTURAS EFICIENTES PARA LA BUSQUEDA = ARBOLES
  un sistea de gestion de correos electroicos desea manejar los correos recibidos 
  * por cada cliente. de c/ u se conoce codigo 1..100, direc de mail, cant de corrreos sin leer
  * i leer y almacenas en una estructura eficiente para la busqueda por codigo de cliente
  * finaliza cliente 1000
  * ii leer cod de cliente e informar cuandos correos sin leer tiene
  * iii imprimir todos los cod de cliente de mayor a menor
  * iv leer una direccion de correo e informar si existe un cliente con esa direc
  * preguntar carga!!!
  * como hacer un random string???? vector de string??
  *
}

program ejemplo1.video;

type
  cliente= record
    mail: string;
    cod: 1..10;
    cantSinLeer: integer;
    end;
    arbol=^nodo;
    nodo= record
     dato : cliente;
     HD, HI: arbol;
     end; 
procedure leer (var c: cliente);
begin
 with c do begin
 writeln('cod'); readln(cod);
 writeln('meil');readln(mail); 
 writeln('correos sin leer');readln(cantSinLeer);
 end;
end;
procedure agregarA(var a: arbol; c: cliente);

begin
  if (a = nil) then begin
    new(a); a^.dato:= c;
    a^.HD:= nil; a^.HI:= nil;
   // a:= aux;????????????????????
  end
   else if (a^.dato.cod> c.cod) then
     agregarA(a^.HI, c)
   else 
     agregarA(a^.HD, c);   
end;
procedure cargarA(var a: arbol);
var 
cli: cliente;
begin
  repeat
   leer(cli);
   agregarA(a, cli);
  until (cli.cod = 10);
  end;
function InformarC(a: arbol; cod: integer): integer; //ver
var retorno: integer;
begin
  if (a = nil) then 
    retorno:= -1
  else begin
    if (cod = a^.dato.cod) then
      retorno:= a^.dato.cantSinLeer
    else if (cod > a^.dato.cod) then 
      retorno:= InformarC(a^.HD, cod)
    else
      retorno:= InformarC(a^.HI, cod);
  end;
  InformarC:=retorno;
  end;
 procedure imprimir(a: arbol);
 begin
   if (a<> nil) then begin
     imprimir (a^.HI);
     writeln('codigo', a^.dato.cod);
     imprimir (a^.HD);
 end;
 end;
function estaMail (a: arbol; mailAbuscar: string): boolean; //
var ok: boolean;
begin
  if (a = nil) then  //siempre arranco asi pregunto si es nil
    ok:= false
  else 
    if (a^.dato.mail = mailAbuscar)then //pregunto si es el nodo en el que estoy parado
      ok:= true
    else begin
     ok:=estaMail (a^.HI, mailAbuscar); //sino voy por la izq
     if (not ok) then //sino voy por la derecha
       ok:=estaMail (a^.HD, mailAbuscar);
     
  end;
  estaMail:= ok;
end;
VAR
 a: arbol;mailC: string;
 codC,inciso: integer;
BEGIN
  a:= nil;
  cargarA(a);
  writeln('-------------------------------');
  imprimir(a);
  writeln('leer cod cliente');readln(codC);
  inciso:=InformarC(a, codC);
  writeln('la cantidad de correos sin leer es ', inciso);
  writeln('leer mail cliente');readln(mailC);
  writeln('el cliente esta es',estaMail(a,mailC));
	
	
END.

