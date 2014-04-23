package cinemaweb

class PeliculaController {
	static scaffold = true

    def show = {
    	def pelicula = Pelicula.get(params.id)
    	def comentarios = pelicula.obtenerComentarios()

    	[pelicula: pelicula, comentarios: comentarios]
    }

    def comentar = {
    	def usuario = Usuario.miUsuario()
    	def pelicula = Pelicula.get(params.id)

    	usuario.comentar(pelicula, params.mensaje)
    	redirect(action: "show", id: params.id)
    }

    def puntuar = {
    	def usuario = Usuario.miUsuario()
    	def pelicula = Pelicula.get(params.id)

    	usuario.puntuar(pelicula, params.puntos)
    	redirect(action: "show", id: params.id)
    }
}
