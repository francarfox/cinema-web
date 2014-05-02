package cinemaweb
import grails.converters.JSON

class SalaController {

	static scaffold = true

	def create = {
		if (params.submit > 0) {
			/*JSON.use('deep')
        	render params as JSON
        	return*/
        	String nombre = params.nombre
        	def filas = params.filas
        	def columnas = params.columnas
        	def sala = new Sala(nombre: nombre, filas: filas, columnas: columnas)
        	sala.save()

        	redirect(action: "index")
        }
    }

    def edit = {
    	def sala = Sala.get(params.id)

    	if(params.submit > 0){
    		sala.nombre = params.nombre
    		sala.filas = params.filas
    		sala.columnas = params.columnas
    		sala.save()

    		redirect(action: "show")
    	}

    	[sala: sala]
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
			JSON.use('deep')
				render params.toAdd as JSON
				return
			params.toAdd.each {
				def pos = it.split(",")
				/*JSON.use('deep')
				render it as JSON
				return
				/*def asiento = new Asiento(fila: pos[0],columna: pos[1])
				sala.addToAsientos(asiento)*/
			}
			}else if(params.toRemove){
			/*params.toRemove.each {
				def pos = it.split(",")
				/*def asiento = new Asiento(fila: pos[0],columna: pos[1])
				sala.addToAsientos(asiento)
				}*/
			}

			sala.save();
			redirect(action: "show")
		}


	//funciones auxiliares

	private def getAsientosOcupados(def asientos){
		def asientosOcupados = []
		if (asientos) {
			asientos.each {asientosOcupados.add(it.fila + "," + it.columna)}
		}

		return asientosOcupados

	}

}
