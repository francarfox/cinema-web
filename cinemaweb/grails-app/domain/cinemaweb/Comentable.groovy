package cinemaweb

abstract class Comentable {

	Set<Comentario> comentarios = []
    Boolean esComentableEnHome = true
    Integer cantComentarios = 0

	static hasMany = [comentarios: Comentario]

    static constraints = {
    	
    }

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
        return this.comentarios.sort{a, b -> a.id <=> b.id }.reverse()
    }

    def getCantidadComentarios() {
        return this.comentarios.size()
    }

    def sumarCantidadComentarios() {
        this.cantComentarios = this.cantComentarios + 1
    }

    def eliminarComentario(comentario) {
        this.removeFromComentarios(comentario)
    }
}
