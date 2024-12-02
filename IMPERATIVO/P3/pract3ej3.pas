{ yo me prepare para este parcial, apruebo
 3. Implementar un programa que contenga:
 a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
 Informática y los almacene en una estructura de datos. La información que se lee es legajo,
 código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
 generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
 guardarse los finales que rindió en una lista.
 b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.
 c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
 su cantidad de finales aprobados (nota mayor o igual a 4).
 c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.

   
}


program untitled;
type
	finales = record
		codMateria : integer;
		fecha: string;
		nota: integer;
	end;
	info = record
		legajo : integer;
		fin: finales;
	end;
		listaFinales= ^nodo;
		nodo= record
			dato: finales;
			sig:listaFinales;
		end;
	infoA = record
		legajo : integer;
		finales: listaFinales;
	end;
		arbol =^no;
		no = record
			dato: infoA;
			hi, hd: arbol;
		end;
		datoNue= record
		leg: integer;
		prom: real;
	end;
		listaNue=^nodon;
		nodon= record
			dato: datoNue;
			sig: listaNue;
			end;
procedure leer(var i: info);
begin
	writeln('leer legjo'); readln(i.legajo);
	if i.legajo <> 0 then begin
	writeln('leer fecha de final'); readln(i.fin.fecha);
	writeln('leer codMateria');i.fin.codMateria:= random (100); //readln(i.fin.codMateria);
	writeln('leer nota'); i.fin.nota:= random (11);//readln(i.fin.nota);
end;
end;
procedure agregarAL (var l: listaFinales; f: finales);
var nue: listaFinales;
begin
	new (nue);
	nue^.dato:= f;
	nue^.sig:= l;
	l:= nue;
end;
procedure agregarA (var a: arbol; ii: info);
begin
	if (a= nil) then begin
		new (a);
		a^.dato.legajo:= ii.legajo;
		a^.dato.finales:= nil;
		agregarAL (a^.dato.finales, ii.fin);
		a^.hd:= nil; a^.hi:= nil;
	end
	else begin
		if (a^.dato.legajo= ii.legajo) then 
			agregarAL (a^.dato.finales, ii.fin)
		else if (a^.dato.legajo > ii.legajo)  then
			agregarA(a^.hi, ii)
		else 
			agregarA(a^.hd, ii)
	end;
end;
procedure cargarA (var a: arbol);
var i: info;
begin
	leer(i);
	while i.legajo <> 0 do begin
		agregarA(a, i);
		leer(i);
	end;
end;
{ b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.}
 {proceso y function idem }
 procedure  legImpar (a: arbol; var c: integer);
 begin
	if (a<> nil) then  begin	
		legImpar(a^.hi, c);
		if not(a^.dato.legajo mod 2=0) then 
					c:= c + 1;
		legImpar(a^.hd, c);
	end;
end;
  function cantImpar(a: arbol): integer;
 var 
   cant: integer;
 begin
   if (a= nil) then 
     cant:=0
   else begin
     cant:= cantImpar(a^.hi);
     if not(a^.dato.legajo mod 2=0) then
       cant:= cant + 1 ;;
     cant:= cant + cantImpar(a^.hd);
   end;
   cantImpar:=cant;
 end;
 procedure calcular (l: listaFinales);
 var cant: integer;
 begin
	cant:= 0;
	while l<> nil do begin
		if l^.dato.nota >= 4 then
		cant:= cant+1;
	l:= l^.sig;
	end;
	writeln('la cantidad de finales aprobados es:', cant);
 end;
 {c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
 su cantidad de finales aprobados (nota mayor o igual a 4).}
 procedure incisoC (a: arbol);
 begin
	if (a<> nil) then begin
		incisoC(a^.hi);
		writeln('legajo n ', a^.dato.legajo);
		calcular(a^.dato.finales);
		incisoC(a^.hd);
	end;
 end;
 function ver (l: listaFinales): real;
 var sum: real; cant: integer;
 begin
 sum:= 0; cant:=0;
 while l <> nil do begin
	cant:= cant +1;
	sum:= sum + l^.dato.nota;
	l:= l^.sig;
 end;
 ver:= sum/cant;
 end;
 procedure agregarANue (var l: listaNue; le: integer; promedio: real );
 var nue: listaNue;
begin
	new (nue);
	nue^.dato.leg:= le;
	nue^.dato.prom:= promedio;
	nue^.sig:= l;
	l:= nue;
end;
 { c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.promedio = notas / cant finales}
 procedure incisoc2 (a: arbol; x: real; var l2: listaNue);
 begin
	if (a<> nil) then begin
		incisoc2(a^.hi, x, l2);
		if (ver (a^.dato.finales) > x ) then
			agregarANue (l2, a^.dato.legajo, ver (a^.dato.finales));
		incisoc2(a^.hd, x, l2);
 end;
 end;
var 
a: arbol; l2: listaNue; valorX: real; cant,impares: integer;
BEGIN
	a:= nil;
	cargarA(a);
	incisoC (a);
	impares:= cantImpar(a);
	cant:= 0;
 legImpar(a, cant);
	writeln('cant con legajo impar es de la funcion :', impares);
	writeln('cant con legajo impar es del procedimiento:', cant);
	END.

