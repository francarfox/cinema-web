package cinemaweb

class Pelicula extends Comentable {
	String nombre
    String director
    Integer genero
    String sinopsis
    String foto
    Integer duracion
    int puntos = 0
    
    static hasMany = [funciones: Funcion]

    static generos = [1: "Drama", 
                      2:"Comedia", 
                      3:"Accion" ,  
                      4:"Aventura" , 
                      5:"Terror", 
                      6: "Ciencia Ficcion", 
                      7: "Musical", 
                      8: "Suspenso",
                      9: "Animacion"]

    static constraints = {
    	nombre blank: false
        director blank: false
        sinopsis blank: false
        genero nullable: false
        duracion min:30
        puntos min: 0
        foto blank:true
    }

    def agregarPuntos(puntos) {
        int entero = puntos as int
        this.puntos += entero   //probando
    }

}