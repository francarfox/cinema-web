package cinemaweb

import grails.transaction.Transactional

@Transactional
class SalaService extends DomainService{

	public def getDomainInstance(String id = ""){
		return (id) ? Sala.get(id) : new Sala()
	}


	public def getSala(String id){
		return this.getDomainInstance(id)
	}

	public def getSalas(){
		return Sala.list();
	}


	public def addAsientos(String id, def listaAsientos) {
		def sala = this.getDomainInstance(id)
		listaAsientos.each {
                def pos = it.split(",")
                def asiento = new Asiento(fila: pos[0],columna: pos[1])
                sala.addToAsientos(asiento)
         }
         sala.save()
	}

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
