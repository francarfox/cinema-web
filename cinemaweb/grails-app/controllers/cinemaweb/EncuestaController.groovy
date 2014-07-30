package cinemaweb
import grails.converters.JSON

class EncuestaController {

	static scaffold = true
	def encuestaService

    def index() { 
    	def encuesta = this.encuestaService.getListadoEncuestas()
    	[encuesta: encuesta]
    }

    def create() {

    }

    def armar() {  	
    	def errors = null
        if(params.submit) {
           	errors = this.encuestaService.create(params)
           	if(!errors) {
				redirect(action:"show", controller:"circulo", id:params.id)
			} else {
				render(view:"create",model:[errors:errors])
			}
    	} else {
    		render(view:"create")
    	}
    }

    def votar(Integer opc){
    	if(params.submit) {
    		def usuario = Usuario.get(session.loggedUser)
    		def encuesta = Encuesta.get(params.id)
    		this.encuestaService.votar(opc,encuesta,usuario)
    		redirect(action:"show", controller:"circulo", id:params.circulo)
    	}	
    }

    def delete() {
    	this.encuestaService.delete(params)
		redirect(action:"show", controller:"circulo", id:params.circuloid)
    }

}
