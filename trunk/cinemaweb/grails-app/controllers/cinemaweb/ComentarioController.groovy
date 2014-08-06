package cinemaweb

class ComentarioController {
	def scaffold = true;

    def index() { }

    def indexusuario() {
    	def usuario = Usuario.get(session.loggedUser)	//usar service
    	def comentarios = usuario.obtenerComentarios();

    	[comentarios: comentarios]
    }
}
