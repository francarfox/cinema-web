package cinemaweb

class Opcion {

	String nombre
	Integer cantidad = 0

    static constraints = {
    	nombre blank:false, nullable:false
    }

    def sumarCantidad() {
    	this.cantidad = this.cantidad + 1
    }

    def obtenerOpcion(Integer id) {
    	def opcion = Opcion.findById(id)
    	return opcion
    }

    def eliminarOpcion() {
    	this.delete()
    }
}
