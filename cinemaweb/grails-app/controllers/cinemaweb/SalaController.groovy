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

}
