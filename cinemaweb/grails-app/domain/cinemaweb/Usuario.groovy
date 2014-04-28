package cinemaweb

class Usuario {

	String userId
	String password
	String passwordV
	Perfil perfil
	Date cuentaCreada = new Date() //editar esto ya que cuando se editan los datos se modifica este dato


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
				/*if (!pass.matches('^.*(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$')) {
					return 'usuario.password.error.strength'
				}*/
		})

		passwordV(nullable:false, validator: { pass2, usuario ->
					return pass2 == usuario.password
		})

		
    }

    static miUsuario() {
    	return Usuario.get(1)	//probando
    }

    String toString() {
    	return userId
    }

    def comentar(comentable, mensaje) {
    	def comentario = new Comentario(autor:this, mensaje: mensaje)
    	comentable.agregarComentario(comentario)
    }

    def puntuar(puntuable, puntos) {
    	puntuable.agregarPuntos(puntos)
    }
}
