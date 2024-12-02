{
   TEMA 2
Módulo Imperativo
30/03/2023 IMPORTANTE: Cree un programa en Pascal. Utilice su apellido como nombre del programa y del archivo .pas, y guardelo en el Escritorio de su computadora.
La ciudad de La Plata está organizando un festival de música. Para ello abrió la inscripción para que las bandas locales puedan participar del festival
* . De la banda se desea conocer su nombre, estilo musical (codificado numéricamente del 1 al 15) y cantidad de integrantes.
a) Implementar un módulo que permita la inscripción de las bandas. El ingreso de datos finaliza con la banda que tiene cero integrantes. 
* Los datos deben estar almacenados en una estructura agrupada por estilo y ordenada por nombre de banda. //vector de lista ordenada
b) Implementar un módulo que reciba la estructura generada en a) y devuelva una nueva estructura con todas las bandas inscriptas ordenada 
* por nombre de mayor a menor (de la Z hasta la A). //vector con rango a..z
c) Implementar un módulo recursivo que reciba la estructura generada en b) y devuelva otra estructura ordenada por nombre de banda,
*  pero que solo tenga los solistas (bandas con cantidad de ingresantes igual a uno). //lista
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
   
   
}


program parcialRandom3;

type
	rangoE= 1..15;
	banda= record
		nombre:string;
		estilo: rangoE;
		cantIntegrantes: integer;
	end;
	lista= ^nodo;
	nodo= record;
	dato: banda;
	sig: lista;
	end;
	v= array [rangoE] of lista;
VAR 
a: arbol;
BEGIN
a:= nil;
cargar(a);
insicoA();
incisoB ();
incisoC ();

	
	
END.

