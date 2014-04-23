package cinemaweb

class Pelicula {
	String titulo
    int puntos = 0
	
	static hasMany = [comentarios: Comentario]

    static constraints = {
    	titulo blank: false, unique: true
        puntos min: 0
    }

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
    	//comentarios.sort(true)
    	return comentarios
    }

    def agregarPuntos(puntos) {
        int entero = puntos as int
        this.puntos += entero   //probando
    }
}