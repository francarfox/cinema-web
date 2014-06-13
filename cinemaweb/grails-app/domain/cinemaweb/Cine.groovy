package cinemaweb

class Cine {
	String nombre
    String ubicacion
    Float  precioBase
    String apertura
    String cierre
    String foto

    //falta agregar funcion
	static hasMany = [comentarios: Comentario, salas: Sala]

    static constraints = {
    	nombre blank: false, unique: true
        ubicacion blank: false
        precioBase blank: false
        foto nullable: true, blank: true
    }   

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
    	//comentarios.sort(true)
    	return comentarios
    }
}
