package cinemaweb
import grails.transaction.Transactional


class CirculoService extends DomainService {

	@Transactional
	public def create(def session, def attributes){

		def usuario = Usuario.get(session.loggedUser)
		
		String nombre = attributes.nombre
		String tags = attributes.tags
		String foto = "default.png"

		def circulo = new Circulo(nombre: nombre, tags: tags, administrador: usuario.getUserId(), foto: foto, esComentableEnHome: false)

		if (circulo.validate()){
			circulo.save(flush: true)
			usuario.addToCirculos(circulo)
			return null
		} else {
			circulo.discard()
			return circulo.errors.getAllErrors()
		}
	}

	@Transactional
	public def edit(Circulo circulo, def attributes){

		circulo.nombre = attributes.nombre
		circulo.tags = attributes.tags

		if (circulo.validate()){
			circulo.save(flush: true)
			return null
		} else {
			circulo.discard()
			return circulo.errors.getAllErrors()
		}

	}

	@Transactional
	public def delete(def attributes){
		def circulo = Circulo.get(attributes.id)
		circulo.eliminarCirculo()
	}

	@Transactional
	public def getDomainInstance(String id=""){
		return (id) ? Circulo.get(id) : new Circulo()
	}

	@Transactional
	public def getListadoCirculos() {
		return Circulo.list()
	}
		
	@Transactional
	public def getCirculo(id) {
		return getDomainInstance(id)
	}
}
