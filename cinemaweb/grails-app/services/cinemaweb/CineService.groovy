package cinemaweb

import grails.transaction.Transactional

@Transactional
class CineService extends DomainService {

	public def getDomainInstance(String id=""){
		return (id) ? Cine.get(id) : new Cine()
	}

	public def getCine(String id){
		return this.getDomainInstance(id)
	}

	public def getListadoCines() {
		return Cine.list()
	}

}
