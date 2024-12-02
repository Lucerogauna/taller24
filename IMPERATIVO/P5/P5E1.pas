{
1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}
program P5E2;
const
	df= 20;
type
  
	ofi= record
		id: integer;
		dniPro: integer;
		valorExpensa: real;
		end;
	vector = array [1..df] of ofi;
procedure leerO(var o: ofi);
begin
	writeln('leer codigo id'); readln(o.id);
	if o.id <> 0 then begin
		writeln('leer dni del propietario'); o.dniPro:= random(10001);//readln(o.dniPro);
		writeln('leer valor expensa'); o.valorExpensa:= random(1034);//readln(o.valorExpensa);
	end;
end;
procedure agregarV (var v: vector; var dl: integer; o: ofi);
begin
	dl:=dl+1;
	v[dl]:= o;
end;
procedure cargarV(var v: vector; var dl: integer);
var 
  o: ofi;
begin
	leerO(o);
	while (o.id <> 0) do begin
		agregarV (v, dl, o);
		leerO(o);
end;
end;
procedure ordenarVSeleccion (var v: vector; dl: integer);
var 
  i, j, pos: integer;
  item: ofi;
begin
	for i:= 1 to (dl - 1) do begin
		pos:= i;
		for j:= i+1 to dl do 
			if ((v[j].id) < (v[pos].id)) then
				pos:= j;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
	end;
end;
procedure imprimir(v: vector; dl: integer);
var i: integer;
begin
	for i:= 1 to dl do begin
	writeln('codigo id -->', v[i].id);
	writeln('dni del propietario', v[i].dniPro);
	writeln('valor expensa', v[i].valorExpensa: 2:0);
end;
end;
{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.}
function busquedaDicVector(v: vector; ini, fin: integer;  codAbuscar: integer): integer; //retorna la pos si lo encontro
var medio: integer; pos: integer;
begin
	if ini<= fin then begin
		medio:= (fin + ini )div 2;
		if (v[medio].id = codAbuscar) then
				pos:= medio
		else if (codAbuscar >v[medio].id )then begin
			ini:= medio +1;
			pos:= busquedaDicVector(v, ini, fin, codAbuscar)
	end
	else begin
			fin:= medio  - 1;
			pos:= busquedaDicVector(v, ini, fin, codAbuscar)
	end;
  end
	else
		pos:=0;
	busquedaDicVector:=pos
end;
var dl: integer; v: vector; pos, ini, codX: integer;
BEGIN
dl:=0;
	cargarV(v, dl);
	imprimir(v, dl);
	ordenarVSeleccion(v, dl); 
	writeln('////////imprime ordenado ///////');
	imprimir(v, dl); 
	readln(codX);
	ini:= 1;
	pos:= busquedaDicVector(v, ini, dl, codX);
	writeln('la pos en la que se encontro es ', pos);
	if (pos <> 0) then
	writeln('la el dni es  ', v[pos].dniPro)
	else
	writeln('no se encontro')
	
	
END.

