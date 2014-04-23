package cinemaweb

class Cine {
	String nombre

	static hasMany = [comentarios: Comentario]

    static constraints = {
    	nombre blank: false, unique: true
    }

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
    	//comentarios.sort(true)
    	return comentarios
    }
}
