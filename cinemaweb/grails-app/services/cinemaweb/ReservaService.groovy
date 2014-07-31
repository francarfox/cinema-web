package cinemaweb

import grails.transaction.Transactional


class ReservaService extends DomainService{

	@Transactional
	public def getDomainInstance(String id = ""){
		return (id) ? Reserva.get(id) : new Reserva()
	}


	def getDataFunciones(peliculaID){
		def dataFunciones = this.getFuncionesPelicula(peliculaID)
		//cargo funciones desde hoy hasta 5 días
		return (0..5).collect{add -> new Date().plus(add).clearTime()}
					  .collect{date->
							def funcionesList = []
					  		dataFunciones.each{ funcion->
					  			if((funcion.desde.compareTo(date) <= 0) && (funcion.hasta.compareTo(date) >= 0)){
					  				funcionesList << [cine: funcion.cine.id, 
					  								 nombre: funcion.cine.nombre, 
					  								 funcionID: funcion.id,
					  								 precio: funcion.precio,
					  								 horario: funcion.horario]
					  			}
					  		}

							funcionesList = funcionesList.sort { 
															//ordeno por horario
															a,b -> a.horario <=> b.horario								
														 }.sort{
														 	//ordeno por cine
														 	a,b -> a.cine <=> b.cine
														 }.groupBy([{it.cine}])//agrupo por cine

							[fecha: date.format("dd-MM-YYYY"), funciones: funcionesList]
							
						}.findAll { obj ->
							//traigo solos los dias que hay funciones
							obj.funciones.size() > 0
						}
	}
	

	def getFuncionesPelicula(peliculaID){
		def filmID = peliculaID.toLong()
		def now = new Date().clearTime()
		def criteria = Funcion.createCriteria()
		return criteria.list{
			
			//le("desde",now)
			ge("hasta",now)
			eq("pelicula.id",filmID)
			order("desde","asc")
			order("cine","asc")
		}
	}
}
