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

							[fecha: date.format("dd-MM-yyyy"), funciones: funcionesList]
							
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

	def getSalaFuncion(funcionID){
		return Funcion.get(funcionID).sala
	}


	def getAsientosReservados(idFuncion,fecha){
		def asientosReservados = []
		Funcion.get(idFuncion).getFuncionReservas(fecha).each{reserva->
																reserva.asientos.each { asiento ->
																	asientosReservados.add(asiento.fila + "," + asiento.columna)
																}
															}
		return asientosReservados														
	}


	def crearReserva(params){
		//cargo los asientos reservados.
		def reservaAsientos = params.list("asientos").collect(){
														def posicionAsiento = it.split(",")
														def nuevoAsiento = new Asiento(fila: posicionAsiento[0],columna: posicionAsiento[1])
														nuevoAsiento.save()
														return nuevoAsiento
													}
		def nuevaReserva = this.getDomainInstance()
		nuevaReserva.reserva_key = this.randomIDKey(8)
		nuevaReserva.asientos = reservaAsientos
		nuevaReserva.funcion = Funcion.get(params.funcion)
		nuevaReserva.fecha_funcion = new Date().parse("dd-MM-yyyy",params.fecha)
		nuevaReserva.fecha_reserva = new Date()
		//chqueo que la key de la reserva no sea repetida
		while(!nuevaReserva.save()){
			nuevaReserva.reserva_key = this.randomIDKey(8)
		}

		return nuevaReserva.reserva_key
	}

	/*def getReservaAsientos(params){
		//chequeo que no se hayan reservado los asientos. Sino lanzo exception
		def reservaAsientos = []
		def funcionID = params.funcion
		def fecha = new Date().parse("dd-MM-yyyy",params.fecha)
		def reservaCriteria = Reserva.createCriteria()
		listaAsientos.each{
			def posicionAsiento = it.split(",")
			def result = reservaCriteria.list{
				eq("funcion.id",funcionID)
				eq("fecha_funcion", fecha)
				and{
					asientos{
						eq("fila",posicionAsiento[0])
						eq("columna",posicionAsiento[1])
					}
				}
			}

			if(result.size() > 0){
				throw new Exception("Asiento Tomado")
			}else{
				reservaAsientos << new Asiento(fila: posicionAsiento[0], columna:posicionAsiento[1])
			}
		}
	}*/

	def randomIDKey(cantDigitos){
		def pool = ['a'..'z','A'..'Z',0..9,'_'].flatten()
		Random rand = new Random(System.currentTimeMillis())

		def passChars = (0..cantDigitos).collect { pool[rand.nextInt(pool.size())] }
		return passChars.join()
	}
}
