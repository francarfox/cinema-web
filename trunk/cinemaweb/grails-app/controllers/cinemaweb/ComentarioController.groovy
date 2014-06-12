package cinemaweb

class ComentarioController {
	def scaffold = true;

    def index() { }

    def indexusuario = {
    	def usuario = session.usuario;
    	def comentarios = usuario.obtenerComentarios();

    	[comentarios: comentarios]
    }
}
