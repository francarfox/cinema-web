package cinemaweb

import grails.transaction.Transactional

@Transactional
abstract class DomainService {
 
	public def create(def attributes){
		def domain = this.getDomainInstance()
		this.submitDomainAttributes(domain,attributes)
	}

	public def edit(String id, def attributes){
		def domain = this.getDomainInstance(id)
		this.submitDomainAttributes(domain,attributes)
	}

	protected def submitDomainAttributes(def domainInstance, def attributes){
		domainInstance.properties = attributes
		if(domainInstance.validate()){
			domainInstance.save(failOnError: true)	
			return null
		}else{
			return domainInstance.errors.getAllErrors()
		}
		
	}


	public abstract def getDomainInstance(String id = "");
}
