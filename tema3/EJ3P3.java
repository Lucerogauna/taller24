/* 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
 Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
 (i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
 (iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
 busque e informe el autor del libro “Mujercitas”.
 C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
 almacenen como máximoNlibros? ¿Cómoinstanciaría el estante?
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class EJ3P3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estantes es = new Estantes();
        Autor autor= new Autor ("Juan Carlos", "Biografia", "Argentina");
        Autor autor2= new Autor ("Rolon", "Biografia", "Argentina");
        //autor2 = new Autor(); // no se puede hacer xq apunta a lo mismo que autorr?
        Libro li = new Libro ("Moby Dick", "Minotauro",autor ,"1111");
        Libro li2 = new Libro ("Mujercitas", "La Nación", autor2,"2222"); 
        
       // Libro li3 = new Libro ("hola", "whws", new Autor ("magolla", "eenjcnenc", "argentina") ,"dnd");
        System.out.println( li2.toString());
        es.agregarLibro(li2);
        System.out.println("diml es " + es.getDimLog());
        // li ("hola", "whws",autorr ,"dnd");
        es.agregarLibro(li);
        System.out.println("El estante está lleno: " + es.estaLleno());
        
        Libro l = es.getLibroConTitulo("Mujercitas");
        if (l != null)
            System.out.println(l.getAutor().toString()); 
        
        System.out.println("diml nueva es ");
        System.out.println(es.getDimLog());
        
        
        System.out.println("Estanteria: " +" \n" + es.toString());
       }
    
}
