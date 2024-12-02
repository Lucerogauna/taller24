{
  ARBOL Y LISTAS
  * un sistema de gestion de correos electronicos desea manejar los correos 
  * recibidos por cada cliente. de cada cli se lee su cod del1 al 1000, mail, 
  * todos los mensajes de correo que envio, de cada mensaje se conoce la dir del emisor,
  *  fecha de envio, texto y si fue leido
   i. leer y almacenar los correos electronicos en una estructura de datos 
   * eficiente para la busqueda por cod de cliente. la lectura finalz al ingresar el cliente 0
   * de cada correo se lee id del cliente, mail, y toda la info del mensaje.
   * la info debe quedar agrupada por cliente
   * ii. leer un codifo decliente e informar la cant de correos sin leer
   * leer un direccion de correo e informr la cant de correos enviados desde dicha direccion
   * 
}


program arbol_listas;
type
  correo= record
    mailEmisor: string;
    fecha: integer; //o string
    texto: string;
    asunto: string;
    leido: boolean;
    end;
  rang= 1..1000;
  lista = ^nodo; //lista
  nodo= record
  dato: correo;
  sig: lista;
  end;
  cliente= record
    cod: rang;
    mail: string;
   end;
   mensajeLeido= record //se lee por teclado
     msj: correo;
     cli: cliente;
     end;
   datoCliente= record
     cli: cliente;
     msjs: lista;
     end;
 arbol =^nodo1;
 nodo1= record
   dato1: datoCliente;
   hi, hd: arbol;
   end;
procedure leer(var c: mensajeLeido);
var i: integer;
begin
    writeln('cod'); readln(c.cli.cod);
    writeln('mail'); readln(c.cli.mail);
    writeln('leer info de mensajes');
    writeln('leer mail emisor'); readln(c.msj.mailEmisor);
    writeln('leer fecha'); readln(c.msj.fecha);
    writeln(' texto'); readln(c.msj.texto);
    writeln('asunto'); readln(c.msj.asunto);
    writeln('ingrese 1 paraindicar si fue leido');
    readln(i);
   c.msj.leido:= (i=1);
end;
procedure agregarAD (var l: lista; dat: correo);
var nue: lista;
begin
 new (nue);
 nue^.dato:= dat;
 nue^.sig:= l;
 l:= nue;
end;
procedure agregar(var a: arbol; m: mensajeLeido); 
// es practico hacer de esta manera m: mensajeLeido, que tenga dos registros, porque
//me ahorra asignar campo a campo 

var 
  aux: arbol;
begin
  if (a= nil) then begin
    new(aux);
    aux^.dato1.cli:= m.cli;
    aux^.dato1.msjs:= nil;// incializo la lista de mensajes en nil;
    agregarAD(aux^.dato1.msjs, m.msj);
    a^.hi:= nil; a^.hd:= nil;
    a:= aux;
    end
    else begin 
      if (a^.dato1.cli.cod = m.cli.cod) then
        agregarAD(a^.dato1.msjs, m.msj)
      else
         if (a^.dato1.cli.cod > m.cli.cod) then
        agregar (a^.hi,m)
      else agregar (a^.hd, m);
    end;
end;
function calculo(l: lista): integer;
var 
cant: integer;
begin
 cant:= 0;
while l<> nil do begin
  if (l^.dato.leido = true) then
    cant:= cant+1;
  l:= l^.sig;
  end;
  calculo:= cant;
end;
function CantSinLeer(a:arbol; cod: integer): integer;
var cant: integer;
begin
  if (a = nil) then
    cant:=0
  else begin
    if (a^.dato1.cli.cod = cod) then
      cant:= calculo(a^.dato1.msjs)
    else if (a^.dato1.cli.cod > cod) then 
      cant:= CantSinLeer(a^.hi, cod)
    else
    cant:= CantSinLeer(a^.hi, cod)
  end;
  CantSinLeer:= cant;
end;
function contarCorreosDesde(l:lista; correo: string): integer; 
var cant: integer;
begin
  cant:=0;
  while l<> nil do begin
    if (l^.dato.mailEmisor = correo) then 
    cant:= cant +1;
    l:= l^.sig;
  end;
  contarCorreosDesde:= cant;
end;
function CantCorreos (a: arbol; correo: string): integer;
var c: integer;
begin
  if (a= nil) then
    c:=0
  else begin
   c:= contarCorreosDesde(a^.dato1.msjs, correo )+
   CantCorreos(a^.hi, correo) +
   CantCorreos (a^.hd, correo)
    end;
   CantCorreos:= c;
end;
VAR
 codx: integer; correox: string;
 a: arbol; datos: mensajeLeido;
BEGIN
    leer(datos);
    agregar(a, datos);
	writeln('leer codigo'); readln(codx);
	writeln ('la cantidad de mensajes sin leer del codigo', codx, 'es de:', CantSinLeer(a, codx));
	writeln('leer correo'); readln(correox);
	writeln ('la cantidad de mensajes enviados por el correo', correox, 'es de:',CantCorreos(a, correox));
	
END.

