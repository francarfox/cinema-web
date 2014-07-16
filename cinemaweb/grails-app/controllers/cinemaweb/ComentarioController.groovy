package cinemaweb

class ComentarioController {
	def scaffold = true;

    def index() { }

    def indexusuario = {
    	def usuario = Usuario.get(session.loggedUser)
    	def comentarios = usuario.obtenerComentarios();

    	[comentarios: comentarios]
    }
}
