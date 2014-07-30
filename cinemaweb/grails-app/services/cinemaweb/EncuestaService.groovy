package cinemaweb

import grails.transaction.Transactional

class EncuestaService extends DomainService {

	@Transactional
	public def create(def attributes){
		def circulo = Circulo.get(attributes.id)
		def opcion0 = new Opcion()
    	def opcion1 = new Opcion()
    	def opcion2 = new Opcion()
    	def opcion3 = new Opcion()
    	opcion0.nombre = attributes.opc0
    	opcion1.nombre = attributes.opc1
    	opcion2.nombre = attributes.opc2
    	opcion3.nombre = attributes.opc3
    	List<Opcion> listOpc = [opcion0,opcion1,opcion2,opcion3]
    	def encuesta = new Encuesta(titulo:attributes.titulo)

    	if (encuesta.validate()){
			encuesta.save(flush: true)
			circulo.encuesta = encuesta
			listOpc.each{ encuesta.addToOpciones(it) }
			return null
		} else {
			encuesta.discard()
			return encuesta.errors.getAllErrors()
		}
	}

	@Transactional
	public def votar(Integer opc,Encuesta encuesta, Usuario usuario){
		encuesta.sumarVoto(opc)
    	encuesta.insertarVotador(usuario)
	}

	@Transactional
	public def delete(def attributes){
		def encuesta = Encuesta.get(attributes.id)
    	def circulo = Circulo.get(attributes.circuloid)
		circulo.eliminarEncuesta()
	}

    @Transactional
	public def getDomainInstance(String id=""){
		return (id) ? Encuesta.get(id) : new Encuesta()
	}

	@Transactional
	public def getListadoEncuestas() {
		return Encuesta.list()
	}

}
