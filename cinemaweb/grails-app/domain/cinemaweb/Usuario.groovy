package cinemaweb

class Usuario {

	String userId
	String password
	String passwordV
	Perfil perfil
	Date cuentaCreada = new Date()
	String rol
    Set<Circulo> circulos = []
    Set<Encuesta> encuestas = []
    Set<Comentario> comentarios = []

    static hasMany = [circulos:Circulo,encuestas:Encuesta,comentarios:Comentario] //Un usuario puede tener varios comentarios tambien

    static constraints = {

    	userId blank:false, unique:true, size:3..10

    	password(nullable:false, size:5..15, validator:{pass, usuario -> 
				if(!pass?.equalsIgnoreCase(usuario.userId)) {
					return true
				}
				else
				{
					return false
				}
		})

		passwordV(nullable:false, validator: { pass2, usuario ->
					return pass2 == usuario.password
		})

		rol inList:["ADMIN", "SUPERADMIN", "USER"]		
    }


    def comentar(comentable, mensaje) {
    	def comentario = new Comentario(autor:this, mensaje: mensaje, comentable:comentable)
    	comentable.agregarComentario(comentario)
        this.addToComentarios(comentario)
        comentable.sumarCantidadComentarios()
    }

    def puntuar(puntuable, puntos) {
    	puntuable.agregarPuntos(puntos)
    }

    def obtenerComentarios() {
    	//return Comentario.findAllByAutor(this)
        return this.comentarios.sort{a, b -> a.id <=> b.id }.reverse()
    }

    /*
    def unirseCirculo(circulo) {
    	circulo.agregarUsuario(this)
    }

    def dejarCirculo(circulo) {
    	circulo.expulsarUsuario(this)
    }*/

    def eliminarUsuario() {
    	this.delete(flush: true)
    }

    def buscarUsuario(nombre) {
        usuario.findByUserId(nombre)
    }

}
