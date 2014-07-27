package cinemaweb

import grails.transaction.Transactional


class ReservaService extends DomainService{

	@Transactional
	public def getDomainInstance(String id = ""){
		return (id) ? Reserva.get(id) : new Reserva()
	}


	def getDataFunciones(peliculaID){
		def filmID = peliculaID.toLong()
		return Funcion.findAll("from Funcion as f where f.pelicula.id=?",[filmID],).sort(){a,b -> a.cine.id <=> b.cine.id}.groupBy([{it.cine.id}])
	}

}
