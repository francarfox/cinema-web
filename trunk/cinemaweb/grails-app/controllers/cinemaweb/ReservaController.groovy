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
        def nuevaReserva = null

        if(params.submit){ 
            nuevaReserva = this.reservaService.crearReserva(params)    
            //this.reservaService.crearReserva(params)
        }

        if(nuevaReserva){
            redirect(action: "nueva_pasotres", id: params.id, params: [resID: nuevaReserva])
        }else{
             def sala = this.reservaService.getSalaFuncion(params.funcion)

             def model = [
                     peliculaID: params.id,
                     funcion: params.funcion,
                     fecha: params.fecha,
                     num_asientos: params.num_asientos,
                     salaFilas: sala.filas,
                     salaColumnas: sala.columnas,
                     salaAsientos: sala.getAsientosOcupados(),
                     asientosReservados: this.reservaService.getAsientosReservados(params.funcion,params.fecha)]

            render(view: "pasodos.gsp", model: model)
        }
       
    }

    def nueva_pasotres(){
        render params
    }
}
