package cinemaweb

class HomeController {

    def index() { 
    	def usuarios = Usuario.list(max: 4,  sort: "id", order: "desc")
    	def circulos = Circulo.list(max: 4,  sort: "id", order: "desc")
    	def circulosUlt = Circulo.list(max: 3,  sort: "id", order: "desc")
    	def cines = Cine.list(max: 7,  sort: "id", order: "desc")
    	def peliculas = Pelicula.list(max: 4,  sort: "id", order: "desc")


    	[usuarios:usuarios,circulos:circulos,circulosUlt:circulosUlt,cines:cines,peliculas:peliculas]
    }
}
