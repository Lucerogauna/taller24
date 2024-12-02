/*
 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
 tamaño desus3lados(double), el color de relleno (String) y el color de línea (String).
 Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
 Provea métodos para:--
Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
 Calcular el perímetro y devolverlo (método calcularPerimetro)
 Calcular el área y devolverla (método calcularArea)
 B- Realizar un programa que instancie un triángulo, le cargue información leída desde
 teclado e informe en consola el perímetro y el área.
 NOTA: Calcular el área con la fórmula
 Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐)
 son los lados y .LafunciónraízcuadradaesMath.sqrt(#)
 𝑠 = 𝑎+𝑏+𝑐 /2
 
 */
package tema3;

/**
 *
 * @author alumnos
 */
public class Triangulo {
    private double lad1 ;
    private double lad2 ;
    private double lad3;
    private String colorLinea ;
    private String colorRelleno ;

    public Triangulo(double lad1, double lad2, double lad3, String colorLinea, String colorRelleno) {
        this.lad1 = lad1;
        this.lad2 = lad2;
        this.lad3 = lad3;
        this.colorLinea = colorLinea;
        this.colorRelleno = colorRelleno;
    }
    public Triangulo (){
    };
    public double getLad1() {
        return lad1;
    }

    public void setLad1(double lad1) {
        this.lad1 = lad1;
    }

    public double getLad2() {
        return lad2;
    }

    public void setLad2(double lad2) {
        this.lad2 = lad2;
    }

    public double getLad3() {
        return lad3;
    }

    public void setLad3(double lad3) {
        this.lad3 = lad3;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
  public double calcularPerimetro (double lad1, double lado2, double lad3){
      double aux= lad1+ lado2+lad3;
      return aux;
  }
  public double calcularArea (){ // a puede ser con parametros de lado1, lado2, lado3
      double aux = calcularPerimetro(getLad1(), getLad2(), getLad3())/  2;
      double area= Math.sqrt(aux * (aux - getLad1()) * (aux - getLad2())* (aux- getLad3()));
      return area;
       
  }
  public String toString (){
  String aux = "lado 1 : " + this.lad1 + "lado 2 : " + this.lad2 +"lado 3 : " + this.lad3 + "color relleno" + this.colorRelleno ; 
  return aux; 
  }
}
