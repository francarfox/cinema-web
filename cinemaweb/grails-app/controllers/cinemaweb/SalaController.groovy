package cinemaweb
import grails.converters.JSON

class SalaController{

	static scaffold = true
    def salaService

    def index = {
        [salas: this.salaService.getSalas()]
    }

	def create = {
		if (params.submit > 0) {
			/*JSON.use('deep')
        	render params as JSON
        	return*/
            this.salaService.create(params)
        	redirect(action: "index")
        }

        [cines: Cine.list()]
    }

    def edit = {

    	if(params.submit > 0){
    		/*sala.nombre = params.nombre
    		sala.filas = params.filas.toInteger()
    		sala.columnas = params.columnas.toInteger()
            sala.cine = Cine.get(params.cine)
    		sala.save()*/

            this.salaService.edit(params.id,params)

    		redirect(action: "show", id: params.id)
    	}

    	[sala: this.salaService.getSala(params.id), cines: Cine.list()]
    }


    def show = {
    	def sala = Sala.get(params.id)
    	def asientosOcupados = this.getAsientosOcupados(sala.asientos)

    	[sala: Sala.get(params.id), asientosOcupados: asientosOcupados]
    }


    def updateSeats = {
    	def sala = Sala.get(params.id)
    	if(params.toAdd){
			//cargo todos los asientos
			/*JSON.use('deep')
				render params.toAdd as JSON
				return*/
             params.list("toAdd").each {
                def pos = it.split(",")
                def asiento = new Asiento(fila: pos[0],columna: pos[1])
                sala.addToAsientos(asiento)
            }
            }else if(params.toRemove){
            params.list("toRemove").each {
                def pos = it.split(",")
                def asiento = sala.getAsiento(pos[0].toInteger(),pos[1].toInteger())
                //remuevo el asiento
                sala.removeFromAsientos(asiento)
            }
        }

        sala.save();
        redirect(action: "show", id: params.id)
    }


	//funciones auxiliares

	private def getAsientosOcupados(def asientos){
		def asientosOcupados = []
		if (asientos) {
			asientos.each {asientosOcupados.add(it.fila + "," + it.columna)}
		}

		return asientosOcupados

	}


    private def dumpVar(def var){
        if(var.getClass() == String || var.getClass() == Integer){
            render var
        }else{
            JSON.use('deep')
            render var as JSON
        }
    }

}
