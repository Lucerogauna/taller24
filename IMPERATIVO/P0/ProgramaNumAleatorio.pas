program ProgramaNumAleatorio;

var ale,rango, i: integer;

begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     rango:= 30 -10+1;
     for i:= 1 to 5 do begin
     {ale:= random(10);  elige valores cualquiera de 0 al 10 }
       ale := 10 + random( rango); {devuelve un valor aleatorio en el rango de 10 a 29	}
       writeln ('El numero aleatorio',i,' generado es: ', ale);
   end;
	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.
