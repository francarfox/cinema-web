package cinemaweb
import grails.converters.JSON

class SalaController extends BaseController{

	static scaffold = true
    def salaService
    def debugService

    def index(){
        [salas: this.salaService.getSalas()]
    }

	def create = {
		def errors = null
        def data = this.dataToDisplay(params, null)
        if (params.submit > 0) {
			/*JSON.use('deep')
        	render params as JSON
        	return*/
            errors = this.salaService.create(params)
        	if(!errors){
                redirect(action: "index")    
            }
        }

        [data: data, cines: Cine.list(), errors: errors]
    }

    def edit = {
        def errors = null
        def salaData = this.dataToDisplay(params,this.salaService.getSala(params.id))

    	if(params.submit > 0){
            errors = this.salaService.edit(params.id,params)
            if(!errors){
                redirect(action: "show", id: params.id)    
            }
    	}

    	[data: salaData, cines: Cine.list(), errors:errors, salaID: params.id]
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

    def getAtributosPorDefecto(){
        return [
                nombre: "",
                cine: "",
                filas: "10",
                columnas: "15"
        ]
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
