package cinemaweb

class HomeController {

    def index() { 
    	def usuarios = Usuario.list(max: 4,  sort: "id", order: "desc")
    	def circulos = Circulo.list()
    	def cines = Cine.list()
    	def peliculas = Pelicula.list(max: 6,  sort: "id", order: "desc")


    	[usuarios:usuarios,circulos:circulos,cines:cines,peliculas:peliculas]
    }
}
