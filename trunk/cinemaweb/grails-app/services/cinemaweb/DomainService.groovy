package cinemaweb

import grails.transaction.Transactional

abstract class DomainService {
 	
	def fileService

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
			domainInstance.save(flush: true)	
			return null
		}else{
			domainInstance.discard()
			return domainInstance.errors.getAllErrors()
		}
		
	}	


	public def subirFoto(String id, String fotoAtribute, def file, String path){
		def domainInstance = this.getDomainInstance(id)
		String fileName = id + ".jpg"
        String filePath = path + fileName
        def error = false;
        if(this.fileService.uploadFile(file, filePath)){
        	domainInstance."$fotoAtribute" = fileName
        	domainInstance.save()
        }else{
        	error = true
        }

        return error
	}


	public abstract def getDomainInstance(String id = "")
}
