package cinemaweb

import grails.transaction.Transactional

class SalaService extends DomainService{

	@Transactional
	public def getDomainInstance(String id = ""){
		return (id) ? Sala.get(id) : new Sala()
	}

	@Transactional
	public def getSala(String id){
		return this.getDomainInstance(id)
	}

	@Transactional
	public def getSalas(){
		return Sala.list();
	}

	@Transactional
	public def addAsientos(String id, def listaAsientos) {
		def sala = this.getDomainInstance(id)
		listaAsientos.each {
                def pos = it.split(",")
                def asiento = new Asiento(fila: pos[0],columna: pos[1])
                sala.addToAsientos(asiento)
         }
         sala.save()
	}

	@Transactional
	public def removerAsientos(String id, def listaAsientos){
		def sala = this.getDomainInstance(id)
		listaAsientos.each{
			def pos = it.split(",")
			def asiento = sala.getAsiento(pos[0].toInteger(),pos[1].toInteger())
			sala.removeFromAsientos(asiento)
		}

		sala.save()
	}

}
