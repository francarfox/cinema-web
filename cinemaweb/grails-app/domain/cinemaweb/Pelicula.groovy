package cinemaweb

class Pelicula {
	String titulo
    String director
    String sinopsis
    String foto
    String urlTrailer
    Integer duracion
    int puntos = 0
    
    static hasMany = [comentarios: Comentario, funciones: Funcion]

    static constraints = {
    	titulo blank: false
        director blank: false
        sinopsis blank: false
        duracion min:30
        puntos min: 0
        foto blank:true
    }

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
    	comentarios.sort(true)
    	return comentarios
    }

    def agregarPuntos(puntos) {
        int entero = puntos as int
        this.puntos += entero   //probando
    }
}