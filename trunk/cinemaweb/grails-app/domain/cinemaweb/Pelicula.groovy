package cinemaweb

class Pelicula extends Comentable {
	String nombre
    String director
    String sinopsis
    String foto
    String urlTrailer
    Integer duracion
    int puntos = 0
    
    static hasMany = [funciones: Funcion]

    static constraints = {
    	nombre blank: false
        director blank: false
        sinopsis blank: false
        duracion min:30
        puntos min: 0
        foto blank:true
    }

    def agregarPuntos(puntos) {
        int entero = puntos as int
        this.puntos += entero   //probando
    }
}