package cinemaweb

class CineController {
	static scaffold = true

    def show = {
    	def cine = Cine.get(params.id)
    	def comentarios = cine.obtenerComentarios()

    	[cine: cine, comentarios: comentarios]
    }

    def comentar = {
    	def usuario = Usuario.miUsuario()
    	def cine = Cine.get(params.id)

    	usuario.comentar(cine, params.mensaje)
    	redirect(action: "show", id:params.id)
    }
}
