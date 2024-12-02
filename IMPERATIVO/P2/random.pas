


program random;
procedure imprimirR(num: integer);
var dig: integer;
begin
  if num > 0 then begin
    imprimirR(num div 10);
    writeln(num mod 10);
end;
end;
var n: integer;
BEGIN
  n:= 1234;
  imprimirR(n);	
	
END.

