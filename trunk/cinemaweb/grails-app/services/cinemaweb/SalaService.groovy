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
}
