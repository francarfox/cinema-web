package cinemaweb

abstract class BaseController{

	def dataToDisplay(def params, def domain){
		def porDefecto = null
        if(domain){
            porDefecto = domain.properties
        }else{
            porDefecto = getAtributosPorDefecto();
        }

        return porDefecto.inject([:]){map, attr -> map + [(attr.key) : (params.getAt(attr.key)) ?: attr.value]}
	}

	abstract def getAtributosPorDefecto()

}