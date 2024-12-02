/*
Clase Libro a la cual se agregaron constructores. 
 2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
 autor es un objeto instancia de la clase Autor.
 Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
 y que deben permitir devolver/modificar el valor de sus atributos y devolver una
 representación String formada por nombre, biografía y origen.
 Luegorealice las modificaciones necesarias en la clase Libro
B. - Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los libros
 con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de los
 libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private Autor infoAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor autor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         infoAutor = autor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
   
    public Libro(  String unTitulo,  String unaEditorial, Autor autor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         infoAutor = autor;
         ISBN =  unISBN;
         precio = 100; // por defecto valen 100
    }
    
    public Libro(){
   
    }
    public Autor getAutor (){
        return this.infoAutor;
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= " Título: " +titulo + "\n" +
             " Autor: " +infoAutor.toString() + "\n" +
             " Año Edición: " +añoEdicion + "\n" +
             " ISBN: " + ISBN;
       return (aux);
    }
        
}
