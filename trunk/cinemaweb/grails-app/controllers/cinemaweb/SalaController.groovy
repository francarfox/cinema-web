package cinemaweb
import grails.converters.JSON

class SalaController{

	static scaffold = true
    def salaService

    def index = {
        [salas: this.salaService.getSalas()]
    }

	def create = {
		def errors = null
        if (params.submit > 0) {
			/*JSON.use('deep')
        	render params as JSON
        	return*/
            errors = this.salaService.create(params)
        	if(!errors){
                redirect(action: "index")    
            }
        }

        [cines: Cine.list(), errors: errors]
    }

    def edit = {
        def errors = null
        def salaData = this.salaService.getSala(params.id).properties

    	if(params.submit > 0){
            errors = this.salaService.edit(params.id,params)
            if(!errors){
                redirect(action: "show", id: params.id)    
            }
    	}

    	[sala: salaData, cines: Cine.list(), errors:errors]
    }


    def show = {
    	def sala = this.salaService.getSala(params.id)

    	[sala: sala, asientosOcupados: sala.getAsientosOcupados()]
    }


    def updateSeats = {
    	
    	if(params.toAdd){
			//cargo todos los asientos
             this.salaService.addAsientos(params.id,params.list("toAdd"))
            }else if(params.toRemove){
            this.salaService.removerAsientos(params.id, params.list("toRemove"))
        }

        redirect(action: "show", id: params.id)
    }


	//funciones auxiliares

    private def dumpVar(def var){
        if(var.getClass() == String || var.getClass() == Integer){
            render var
        }else{
            JSON.use('deep')
            render var as JSON
        }
    }

}
