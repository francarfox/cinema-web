package cinemaweb

import grails.transaction.Transactional

class FileService {
	//para recuperar el directorio de imagenes

@Transactional
    Boolean uploadFile(def file, String path) {
    	if(!file.isEmpty() && path!= ""){
    		//path a carpeta imagenes
    		def realPath = System.properties['user.dir'] + "/web-app/images/cinema-web"
    		realPath += path
    		file.transferTo(new File(realPath))
    		return true
    	}

    	return false
    }	
}