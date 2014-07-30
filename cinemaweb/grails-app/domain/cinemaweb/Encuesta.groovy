package cinemaweb

class Encuesta {

	String titulo
	Date encuestaCreada = new Date()
	Set<Usuario> usuarios = []
	Set<Opcion> opciones = []

    static constraints = {
    	titulo blank:false, nullable:false
    	opciones nullable:true
    }

    static hasMany = [usuarios:Usuario, opciones:Opcion]
    static belongsTo = Usuario

    def estaUsuario(String user){
        def cant = usuarios.findAll{it.getUserId() == user}.size()
        if( cant == 0 ) {
            return false
        }
        else {
            return true
        }
    }

    def eliminarOpciones() {
        this.opciones.toList().each{ this.removeFromOpciones(it) }
    }

    def eliminarUsuarios() {
    	this.usuarios.toList().each{ this.removeFromUsuarios(it) }
    }

    def eliminarEncuesta() {
        this.eliminarUsuarios()
        this.eliminarOpciones()
    	this.delete()
    }

    def insertarVotador(Usuario usuario) {
    	this.addToUsuarios(usuario)
    }

    def sumarVoto(String opc) {
        def opcion = this.getOpcion(opc)
        opcion.sumarCantidad()
    }

    def getCantidadTotalVotos() {
    	return this.usuarios.size()
    }

    def getOpcion(String opc) {
        def opcionN = new Opcion()
    	def opcion = opcionN.obtenerOpcion(opc)
        return opcion
    }

    def getVotos(String opc) {
    	def opcion = Opcion.getOpcion(opc)
        return opcion.getCantidad()
    }

}
