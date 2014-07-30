package cinemaweb
import grails.converters.JSON

class EncuestaController {

	static scaffold = true

    def index() { 
    	def encuesta = Encuesta.list()
    	[encuesta: encuesta]
    }

    def create() {

    }

    def armar() {
    	def circulo = Circulo.get(params.id)

    	if (circulo.getAdministrador() == session.loggedUserNombre) {    		
    		def opcion0 = new Opcion()
    		def opcion1 = new Opcion()
    		def opcion2 = new Opcion()
    		def opcion3 = new Opcion()
    		opcion0.nombre = params.opc0
    		opcion1.nombre = params.opc1
    		opcion2.nombre = params.opc2
    		opcion3.nombre = params.opc3
    		List<Opcion> listOpc = [opcion0,opcion1,opcion2,opcion3]
    		def encuesta = new Encuesta(titulo:params.titulo)

    		if (encuesta.validate()){
				encuesta.save(flush: true)
				circulo.encuesta = encuesta
				listOpc.each{ encuesta.addToOpciones(it) }
				redirect(action:"show", controller:"circulo", id:params.id)
			} else {
				render(view:"create")
			}

    	} else {
    		//acceso denegado
    	}
    }

    def votar(String opc){
    	def usuario = Usuario.get(session.loggedUser)
    	def encuesta = Encuesta.get(params.id)

    	//Verificar que me haya enviado algo desde la vista
    	//if (!encuesta.estaUsuario(usuario.getUserId())) {
    		encuesta.sumarVoto(opc)
    		encuesta.insertarVotador(usuario)
    		/*JSON.use('deep')
        	render encuesta as JSON
        	return*/
    		redirect(action:"show", controller:"circulo", id:params.circulo)
    	//} else {
    		//render "YA VOTO"
    		//return
    	//}
    }

    def delete() {
    	def encuesta = Encuesta.get(params.id)
    	def circulo = Circulo.get(params.circuloid)
		//encuesta.eliminarUsuarios()
		//encuesta.eliminarOpciones()
		//circulo.encuesta = null
		circulo.eliminarEncuesta()
		encuesta.eliminarEncuesta()
		redirect(action:"show", controller:"circulo", id:params.circuloid)
    }

    def show() {
    	def encuesta = Encuesta.get(attributes.id)
    	[encuesta: encuesta]	
    }

}
