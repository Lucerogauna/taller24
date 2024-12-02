{

   
   
}


program programaListas;

type
  lista=^nodo;
  nodo= record
    dato: integer;
    sig: lista;
    end;
procedure agregar(var l: lista; a: integer);
var
  nue: lista;
begin
  new (nue);
  nue^.dato:=a;
  nue^.sig:=l;
  l:= nue;
 end;
procedure AgregarOrd (var l: lista; v: integer);
var 
  nue: lista; ant, act: lista;
  begin
    new (nue);
    nue^.dato:=v;
    ant:= l;
    act:=l;
    while (act <> nil) and (act^.dato < nue^.dato) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if act = ant then
      l:= nue
    else 
        ant^.sig:= nue;
        nue^.sig:= act;
      end;
procedure cargar(var l: lista);
var
  n: integer;
  begin
   // randomize;
    n:= 100 + random (150 - 100 + 1);
     writeln('se leyo el numero',n); //linea para coorroborar
    while (n<>120) do begin
     //agregar(l, n);
       AgregarOrd(l, n);
      n:= 100 + random (150 - 100 + 1);
     writeln('se leyo el numero',n);
    end;
  end;
 procedure imprimir(l:lista);
 begin
   while (l<> nil) do begin
   
     writeln('numero ', l^.dato);
     l:=l^.sig;
     end;
 end;
 procedure imprimirAlreves(l:lista);
 begin
     writeln('---------------');
   if l<> nil then begin
     writeln(l^.dato);
     imprimirAlreves(l^.sig);
     end;
 end;
function Buscar (L:lista ; valor:integer):boolean;
 var
 ok:boolean;
 begin
 ok := false;
 while (l <> nil) and (not ok) do begin // mientras no sea el final de la lista  y no encuentre el elemento
	 if (L^.dato = valor) then // si es el elemento detengo la busqueda
      ok := true
    else  // sino avanzo al siguiente
       L := L^.sig;
 end;
 Buscar := ok;
 end;
VAR
  li:lista; esta: boolean; 
BEGIN
        randomize;
		cargar(li);
	    //imprimir(li);
	    imprimir(li);
	   // imprimirAlreves(li);
	    esta:= Buscar(li, 130);
	    writeln(esta);
END.

