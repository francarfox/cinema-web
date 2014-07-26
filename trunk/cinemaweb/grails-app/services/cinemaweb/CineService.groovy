package cinemaweb

import grails.transaction.Transactional

class CineService extends DomainService{

    @Transactional
	public def getDomainInstance(String id=""){
		return (id) ? Cine.get(id) : new Cine()
	}

	@Transactional
	public def edit(String id, def attributes){
		return []
	}

	@Transactional
	public def getCine(String id){
		return this.getDomainInstance(id)
	}

	@Transactional
	public def getListadoCines() {
		return Cine.list()
	}

}
