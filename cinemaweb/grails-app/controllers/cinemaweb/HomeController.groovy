package cinemaweb

class HomeController {

    def index() { 
    	def usuarios = Usuario.list(max: 4,  sort: "id", order: "desc")
    	def circulos = Circulo.list(max: 4,  sort: "cantUsuarios", order: "desc")
    	def circulosUlt = Circulo.list(max: 3,  sort: "id", order: "desc")
    	def cines = Cine.list(max: 7,  sort: "cantComentarios", order: "desc")
    	def peliculasPunt = Pelicula.list(max: 4, sort: "puntos", order: "desc")
    	def peliculas1 = Pelicula.list(max: 7,  sort: "id", order: "desc")
    	def peliculas2 = Pelicula.list(max: 7,  offset: 7, sort: "id", order: "desc")
    	def peliculas3 = Pelicula.list(max: 7,  offset: 14, sort: "id", order: "desc")
        def comentarios = Comentario.list(max: 6,sort: "id", order: "desc")

    	//def circulos = circulosPop.sort{a,b-> a.getCantidadUsuarios().compareTo(b.getCantidadUsuarios())}.reverse()
        //def cines = cinesPop.sort{a,b-> a.getCantidadComentarios().compareTo(b.getCantidadComentarios())}.reverse()

    	[
    		usuarios:usuarios,
    		circulos:circulos,
    		circulosUlt:circulosUlt,
    		cines:cines,
    		peliculasPunt:peliculasPunt,
    		peliculas1:peliculas1,
    		peliculas2:peliculas2,
    		peliculas3:peliculas3,
            comentarios:comentarios
    	]
    }

    def contacto() {
        
    }
}
