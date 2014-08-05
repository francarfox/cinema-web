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
            //guardo el id de la reserva en la session
            session["reserva_provisoria"] = nuevaReserva
            redirect(action: "nueva_pasotres", id: params.id)
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
        if(params.finish){
           this.reservaService.submitTransaccion(session["reserva_provisoria"])
           redirect(action: "reserva_gracias", id: params.id)
        }else{
           def reservaProvisoria = this.reservaService.getReservaProvisoria(session["reserva_provisoria"])
            render(view: "pasotres.gsp", model: [reservaProvisoria: reservaProvisoria]) 
        }
        
    }


    def reserva_gracias(){
        def reserva = this.reservaService.getReservaProvisoria(session["reserva_provisoria"])
        render(view: "gracias.gsp", model: [reserva: reserva])
    }


    def borrar_provisoria(){
       def reservaProvisoria = this.reservaService.getReservaProvisoria(params.reservaID)
       reservaProvisoria.delete(flush: true)
       //borro la key 
       session["reserva_provisoria"] = ""
    }
}
