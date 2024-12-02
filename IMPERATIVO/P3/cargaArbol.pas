{
   cargaArbol.pas
   
   Copyright 2024 Usuario <Usuario@DESKTOP-U6ORN85>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}
Program arboles;
Type
  arbol = ^nodo;
  
  nodo = record
          dato: integer;
          HI: arbol;
          HD: arbol;
         end;
Procedure agregar (var a:arbol; num:integer);
Begin
  if (a = nil) then
   begin
      new(A);
      a^.dato:= num; a^.HI:= nil; a^.HD:= nil;
   end
   else
    if (num <= A^.dato) then agregar(a^.HI,num)
    else agregar (a^.HD,num)   
end;
procedure imprimirEnOrden(a: arbol); 
 begin
   if (a<> nil) then begin
     imprimirEnOrden (a^.HI);//cuando termina todo el lado izq va a la derecha
     writeln(a^.dato);
     imprimirEnOrden (a^.HD);
 end;
 end;
Var
 a:arbol;
 num: integer;
Begin
  a:= nil; //indico que el árbol está vacío

   read (num); //leo un valor
   while (num <> 50) do

     begin
       agregar (a,num); //agrego el valor al arbol
       read (num);
     end;
     imprimirEnOrden(a);
End.
