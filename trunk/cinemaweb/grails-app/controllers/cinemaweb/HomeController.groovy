package cinemaweb

class HomeController {

    def index() { 
    	def usuarios = Usuario.list(max: 4,  sort: "id", order: "desc")
    	def circulos = Circulo.list(max: 4,  sort: "id", order: "desc") //ordenar por circulo.usuarios.size()
    	def circulosUlt = Circulo.list(max: 3,  sort: "id", order: "desc")
    	def cines = Cine.list(max: 7,  sort: "id", order: "desc") //ordenar por cine.comentarios.size()
    	def peliculasPunt = Pelicula.list(max: 4,  sort: "puntos", order: "desc")
    	def peliculas1 = Pelicula.list(max: 7,  sort: "id", order: "desc")
    	def peliculas2 = Pelicula.list(max: 7,  offset: 7, sort: "id", order: "desc")


    	[
    		usuarios:usuarios,
    		circulos:circulos,
    		circulosUlt:circulosUlt,
    		cines:cines,
    		peliculasPunt:peliculasPunt,
    		peliculas1:peliculas1,
    		peliculas2:peliculas2
    	]
    }
}
