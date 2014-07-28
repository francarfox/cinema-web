package cinemaweb

import grails.converters.JSON

class ReservaController {

	def reservaService

    def index() { 
		//devuelvo las peliculas que tienen funciones
		//render Reserva.getPeliculasReservables()
		[peliculas: Reserva.getPeliculasReservables()]    	
    }

    def nueva_pasouno(){
    	//render this.reservaService.getDataFunciones(params.id) as grails.converters.JSON
		def model= [pelicula: Pelicula.get(params.id), 
    	 			funcionesData: this.reservaService.getDataFunciones(params.id) as grails.converters.JSON 
    				]
    	render(view: "pasouno.gsp", model: model)
    }
}
