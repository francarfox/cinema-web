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


    def nueva_pasodos(){
        def error = null

        if(params.submit){ 
            //error = this.reservaService.crearReserva(params)
            render params.asientos.list()
        }

        def sala = this.reservaService.getSalaFuncion(params.funcion)

        def model = [
                     peliculaID: params.id,
                     funcionID: params.funcion,
                     fecha: params.fecha,
                     num_asientos: params.num_asientos,
                     error: error,
                     salaFilas: sala.filas,
                     salaColumnas: sala.columnas,
                     salaAsientos: sala.getAsientosOcupados()]

        render(view: "pasodos.gsp", model: model)
    }
}
